class StartController < ApplicationController
def index
   @articles = Article.all
end
end
