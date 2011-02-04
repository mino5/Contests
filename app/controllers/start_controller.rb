class StartController < ApplicationController
def index
   @articles = Article.paginate :page => params[:page], :per_page => 6, :order => "created_at"
end
end
