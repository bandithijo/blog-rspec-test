class AuthorsController < ApplicationController
  def index
    @authors = Author.includes(:articles).all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to author_path(@author)
    else
      render 'new'
    end
  end

  private

  def author_params
    params.require(:author).permit(:full_name, :email, :password)
  end
end
