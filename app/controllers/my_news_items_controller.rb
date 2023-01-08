# frozen_string_literal: true

class MyNewsItemsController < SessionController
  before_action :set_representative, only: %i[search_issue_rep]

  before_action :set_news_item, only: %i[edit update destroy]

  def new
    @news_item = NewsItem.new
    @representative = Representative.find(:name => params[:representative_name])
    @issue = params[:issue]
  end

  def edit
    # get representative with the name
    # issue with the from the parameters
  end
  
  def search
    render :new
  end

  def search_issue
    @representative = Representative.find_by_name(params[:representative_name])
    @issue = params[:issue]
    redirect_to search_news_issue_rep_path(@representative, @issue)
  end

  def search_issue_rep
    newsapi = News.new("de90eb71b1014faca2ed961ac8b1be50")
    @news_items = newsapi.get_everything(q: params[:issue], language: "en", sortBy: 'relevancy',page: 1)
    render :new2

  end

  def rate_articles
    @ratings = params[:rating]
    @article_title = params[:articles]
    
    newsapi = News.new("de90eb71b1014faca2ed961ac8b1be50") 
    @news_items = newsapi.get_everything(q: params[:issue], searchIn: @article_title, sortBy: 'relevancy',page: 1)
    newsrating = Rating.create(params[:representative_id], @article_title, @ratings) 
    render :new
  end

  def create
    @news_item = NewsItem.new(news_item_params)
    if @news_item.save
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully created.'
    else
      render :new, error: 'An error occurred when creating the news item.'
    end
  end

  def update
    if @news_item.update(news_item_params)
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully updated.'
    else
      render :edit, error: 'An error occurred when updating the news item.'
    end
  end

  def destroy
    @news_item.destroy
    redirect_to representative_news_items_path(@representative),
                notice: 'News was successfully destroyed.'
  end

  private

  def set_representative
    @representative = Representative.find(
      params[:representative_id]
    )
  end

  def set_representatives_list
    @representatives_list = Representative.all.map { |r| [r.name, r.id] }
  end

  def set_news_item
    @news_item = NewsItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def news_item_params
    params.require(:news_item).permit(:news, :title, :description, :link, :representative_id)
  end
end
