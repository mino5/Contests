class InvitationsController < ApplicationController
def index
    @invitations = current_user.membership_invitations.all
    @memberships = current_user.memberships.all
end

def accept
   @user = current_user
   @groups = current_user.groups(params[:group_id])
   invitation = MembershipInvitation.find(params[:id])
   @membership = current_user.memberships.new(:group_id => invitation.group_id)
   
   invitation.delete
   @membership.save    
   
   redirect_to user_invitations_path(current_user)
end

def show
end

end
