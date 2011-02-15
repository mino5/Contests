class AddZadanieToArticles < ActiveRecord::Migration
  def self.up
	add_column :articles, :zadanie, :text
  end

  def self.down
	remove_column :articles, :zadanie
  end
end
