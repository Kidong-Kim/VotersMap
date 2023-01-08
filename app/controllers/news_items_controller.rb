# frozen_string_literal: true
require 'news-api'
class NewsItemsController < ApplicationController
  before_action :set_representative
  before_action :set_issue
  before_action :set_news_item, only: %i[show]

  def index
    @news_items = @representative.news_items
  end

  def show; end

  private

  def set_representative
    @representative = Representative.find(
      params[:representative_id]
    )
  end

  def set_issue
    @issue = params[:issue]
  end

  def set_news_item
    @news_item = NewsItem.find(params[:id])
  end
  
  def search
    issue = params[:issue]
    rep = params[:representative_id]
    service = News.new
    service.key = Rails.application.credentials[:NEWS_API_KEY]
    result = service.get_news(q: issue, country: "us", language: "en")
    @news_item = NewsItem.issues(result)
  end
end
