class GroupsController < ApplicationController

     before_filter :admin_auth, :only => [:invite]
     before_filter :user_auth, :except => [:index, :new, :create]

     def index
	@groups = Group.all
     end
     
     def show
        @group = Group.find(params[:id])
        @users = @group.users
        @invitation = MembershipInvitation.new
     end    
   
     def new
       @group = Group.new
     end
 
     def create
       @group = Group.create(params[:group].merge(:owner_id => current_user.id))
       
       @membership = @group.memberships.create(:user_id => current_user.id, :admin => true)
 
       redirect_to groups_path
     end

     def invite
       @group = Group.find(params[:id])
       @invitation = MembershipInvitation.new(params[:membership_invitation])
       @invitation.update_attributes(:group_id => @group.id)
       redirect_to groups_path(@group) 
     end
 
     def admin_auth
       @group = Group.find(params[:id])
       
       if (!(@group.admin?(current_user))) 
 	  redirect_to groups_path
       end
     end

    def user_auth
     @group = Group.find(params[:id])
     @valid_user = (@group.users.where(:id => current_user.id).count == 1)
     if (!@valid_user) 
        redirect_to groups_path
     end
    end
end

