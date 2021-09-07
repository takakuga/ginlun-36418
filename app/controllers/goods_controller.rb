class GoodsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @eat = Eat.find(params[:eat_id])
    @good = @eat.user.goods.create(eat_id: params[:eat_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @eat = Eat.find(params[:eat_id])
    @good = @eat.user.goods.find_by(eat_id: @eat.id)
    @good.destroy
    redirect_back(fallback_location: root_path)
  end

end

