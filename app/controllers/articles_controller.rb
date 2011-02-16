class ArticlesController < ApplicationController

helper_method :all
protect_from_forgery

def show
  @article = Article.find(params[:id])
  @comment = Comment.new
  @comments = @article.comments
  
  @articles_mostoften = Article.all(:order => "comments_count DESC")
  @newest_comments = Comment.all(:order => "created_at DESC")
end

end
