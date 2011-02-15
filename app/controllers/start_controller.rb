class StartController < ApplicationController
protect_from_forgery :only => [:create, :delete, :update]

def index
   @search = Article.search(params[:search])
   @articles = @search.paginate :page => params[:page], :per_page => 6, :order => "created_at DESC"
end
end
