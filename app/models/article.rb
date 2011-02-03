class Article < ActiveRecord::Base
require 'paperclip'
	has_many :comments
        has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "150x150~" }
	
        validates_attachment_size :avatar, :less_than => 5.megabytes  
end
