class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @eats = @user.eats
  end
end