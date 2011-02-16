class AboutController < ApplicationController
def index
  @articles_mostoften = Article.all(:order => "comments_count DESC")
  @newest_comments = Comment.all(:order => "created_at DESC")
end
end
