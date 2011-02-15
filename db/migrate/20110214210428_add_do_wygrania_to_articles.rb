class AddDoWygraniaToArticles < ActiveRecord::Migration
  def self.up
	add_column :articles, :dowygrania, :text
  end

  def self.down
	remove_column :articles, :dowygrania
  end
end
