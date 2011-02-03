class Admin::ArticlesController < ApplicationController
layout 'admin'
  def index
    require_admin
    @articles = Article.paginate :page => params[:page], :per_page => 10
  end
  
  def new
   require_admin
   @article = Article.new
  end

  def create
   require_admin
   article = Article.create(params[:article])
   redirect_to admin_articles_path
  end

  def show
   require_admin
   @article = Article.find(params[:id])
  end

  def edit
   require_admin
   @article = Article.find(params[:id])
  end

  def update
   require_admin
   article = Article.find(params[:id])
   article.update_attributes(params[:user])
   redirect_to admin_articles_path
  end
 
  def destroy
  require_admin
  @article = Article.find(params[:id])
  @article.destroy
  redirect_to admin_articles_path
  end
end
