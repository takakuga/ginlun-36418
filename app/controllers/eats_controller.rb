class EatsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :create, :update]
  before_action :move_to_index, except: [:index, :new, :create, :show, :search]

  
  def index
    @eats = Eat.includes(:user).order('created_at DESC')
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
  @comment = Comment.new
  @comments = @eat.comments.includes(:user)
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

  def search
    @eats = Eat.search(params[:keyword])
  end

private

  def eat_params
    params.require(:eat).permit(:title, :shop_name, :category, :price, :detail, :image).merge(user_id: current_user.id)
  end


  def move_to_index
    @eat = Eat.find(params[:id])
    if current_user.id != @eat.user.id
      redirect_to action: :index
    end
  end
end