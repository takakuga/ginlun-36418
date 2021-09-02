class EatsController < ApplicationController
  
  def index
    @eats = Eat.all
  end

  def new
    @eat = Eat.new
  end

  def create
    @eat = Eat.new(eat_params)
    if @eat.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  @eat = Eat.find(params[:id])
  # @comment = Comment.new
  # @comments = @prototype.comments.includes(:user)
  end

  def edit
    @eat = Eat.find(params[:id])
  end

  def update
    @eat = Eat.find(params[:id])
    if @eat.update(eat_params)
      redirect_to root_path
      else
        render :edit
      end
  end

  def destroy
    eat = Eat.find(params[:id])
    eat.destroy
     redirect_to root_path
  end
end

private

  def eat_params
    params.require(:eat).permit(:title, :category, :price, :detail, :image).merge(user_id: current_user.id)
  end
