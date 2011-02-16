class CommentsController < ApplicationController

     def show
        @comment = Comment.find(params[:id])
        @user = User.find(@comment.user_id)
     end

     def index       
       article = Article.find(params[:article_id])
       @article = Article.find(params[:article_id])
       @comments = article.comments
       respond_to do |format|
         format.html
       end
     end
   
     def create
       article = Article.find(params[:article_id])
       @article = Article.find(params[:article_id])
       @comments = Comment.all
       params[:comment][:user_id] = current_user.id
       params[:comment][:name] = current_user.username
       @comment = article.comments.create!(params[:comment])
       flash[:notice] = "Dzięki za komentarz!"
       respond_to do |format|
         format.html { redirect_to article_comments_path }
	 format.js 
       end
     end
  

    def destroy
      @comments = Comment.all
      @comment = Comment.find(params[:id])
      @article = Article.find(@comment.article_id)
      @comment.destroy
      respond_to do |format|
         format.html { redirect_to article_comments_path }
	 format.js
       end
    end

    def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new
    respond_to do |format|
      format.js
      format.html # new.html.erb
   end
end

end
