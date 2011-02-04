class ArticlesController < ApplicationController

def show
  @article = Article.find(params[:id])
  @comment = Comment.new
  @comments = @article.comments
end

end
