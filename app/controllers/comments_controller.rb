class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to eat_path(@comment.eat.id)
      else
        @eat = @comment.eat
        @comments = @eat.comments
      render 'eats/show'
  end
end

private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, eat_id: params[:eat_id])
  end
end
