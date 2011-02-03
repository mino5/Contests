class Admin::UsersController < ApplicationController
layout 'admin'
  def index
    require_admin
    @users = User.paginate :page => params[:page], :per_page => 10
  end
  
  def show
   require_admin
   @user = User.find(params[:id])
  end

  def edit
   require_admin
   @user = User.find(params[:id])
  end

  def update
   require_admin
   user = User.find(params[:id])
   user.update_attributes(params[:user])
   redirect_to admin_users_path
  end
 
  def destroy
  require_admin
  @user = User.find(params[:id])
  @user.destroy
  redirect_to admin_users_path
  end
end
