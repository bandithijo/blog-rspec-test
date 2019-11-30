class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:author).all
  end

  def show
    @article = Article.find(params[:id])
  end
end
