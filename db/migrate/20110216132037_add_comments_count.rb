class AddCommentsCount < ActiveRecord::Migration
   def self.up  
     add_column :articles, :comments_count, :integer, :default => 0  
       
     Article.reset_column_information  
     Article.all.each do |p|  
        p.update_attribute :comments_count, p.comments.length  
     end  
   end  
   
   def self.down  
     remove_column :article, :tasks_count  
   end  
end
