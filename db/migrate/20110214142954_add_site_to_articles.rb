class AddSiteToArticles < ActiveRecord::Migration
  def self.up
	add_column :articles, :site, :text
  end

  def self.down
	remove_column :articles, :site
  end
end
