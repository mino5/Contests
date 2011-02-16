class StartController < ApplicationController
protect_from_forgery :only => [:create, :delete, :update]
helper_method :all

def index
   @search = Article.search(params[:search])
   @articles = @search.paginate :page => params[:page], :per_page => 6, :order => "created_at DESC"
   @articles_mostoften = Article.all(:order => "comments_count DESC")
   @newest_comments = Comment.all(:order => "created_at DESC")
end

end
