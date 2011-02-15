class AddDeadlineToArticles < ActiveRecord::Migration
  def self.up
	add_column :articles, :deadline, :datetime
  end

  def self.down
	remove_column :articles, :deadline
  end
end
