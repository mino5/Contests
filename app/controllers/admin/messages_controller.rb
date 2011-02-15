class Admin::MessagesController < ApplicationController
layout 'admin'
def show
  require_admin
  @message = Message.find(params[:id])
  @user = User.find(@message.user_id)
end

def index
require_admin
@messages = Message.paginate :page => params[:page], :per_page => 10
end

def destroy
  require_admin
  @message = Message.find(params[:id])
  @message.destroy
  redirect_to admin_messages_path
end


end
