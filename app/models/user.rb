class User < ActiveRecord::Base
 has_many :memberships
 has_many :groups, :through => :memberships
 has_many :membership_invitations

 has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "150x150>" }
	
 validates_attachment_size :avatar, :less_than => 5.megabytes  

 acts_as_authentic
end
