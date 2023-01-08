class AddIssueToNewsItems < ActiveRecord::Migration[5.2]
  def change
    add_column :news_items, :fieldname, :issue
  end
end
