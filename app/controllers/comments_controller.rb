class CommentsController < ApplicationController

  def index
    @comment = Comment.new
  end

  def create
    @comment = @user.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format .json
      end
    else
      @comments = @user.comments.includes(:user)
      flash.now[:alert] = 'コメント見入力です'
      render :detail
    end
  end

  private

  def message_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end

end