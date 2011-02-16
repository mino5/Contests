class Comment < ActiveRecord::Base
	belongs_to :article, :counter_cache => true
	default_scope :order => 'created_at DESC'
end
