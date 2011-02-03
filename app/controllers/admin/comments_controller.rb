class Admin::CommentsController < ApplicationController
layout 'admin'
def index
    require_admin
    @comments = Comment.paginate :page => params[:page], :per_page => 10
  end
  
  def show
   require_admin
   @comment = Comment.find(params[:id])
  end

  def edit
   require_admin
   @comment = Comment.find(params[:id])
  end

  def update
   require_admin
   comment = Comment.find(params[:id])
   comment.update_attributes(params[:user])
   redirect_to admin_comments_path
  end
 
  def destroy
  require_admin
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect_to admin_comments_path
  end

end
