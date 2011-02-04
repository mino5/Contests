class User < ActiveRecord::Base
 has_many :memberships
 has_many :groups, :through => :memberships
 has_many :membership_invitations

 has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "55x55#" }, 
 :url => "/system/avatars/:id/:style/:basename.:extension",
 :path => ":rails_root/public/system/avatars/:id/:style/:basename.:extension",
 :default_url => "/system/avatars/missing.png"

	
 validates_attachment_size :avatar, :less_than => 5.megabytes  

 acts_as_authentic
end
