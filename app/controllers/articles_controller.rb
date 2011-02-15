class ArticlesController < ApplicationController
helper_method :nl2br
protect_from_forgery
def show
  @article = Article.find(params[:id])
  @comment = Comment.new
  @comments = @article.comments
end

def nl2br(s)
    s.gsub!(/\n/, '</br>')
end

end
