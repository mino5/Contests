class CommentsController < ApplicationController
     def index
       @comments = Comment.all
       respond_to do |format|
         format.html
       end
     end
   
     def create
       @comments = Comment.all
       @comment = Comment.create!(params[:comment])
       flash[:notice] = "Dzięki za komentarz!"
       respond_to do |format|
         format.html { redirect_to comments_path } 
         format.js
       end
     end
  

    def destroy
      @comments = Comment.all
      @comment = Comment.find(params[:id])
      @comment.destroy
      respond_to do |format|
         format.html { redirect_to comments_path }
         format.js
       end
    end
end
