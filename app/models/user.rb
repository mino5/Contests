class User < ActiveRecord::Base
 has_many :memberships
 has_many :groups, :through => :memberships
 has_many :membership_invitations


 acts_as_authentic
end
