class Group < ActiveRecord::Base
    has_many :memberships
    has_many :users, :through => :memberships
    
    def member?(user)
      users.include?(user)
    end

    def invited?(user)
      membership_invitations.map(&:user_id).include?(user.id)
    end
  
    def admins
      memberships.where(:admin => true).map(&:user)
    end

    def admin?(user)
      admins().include?(user)
    end
end
