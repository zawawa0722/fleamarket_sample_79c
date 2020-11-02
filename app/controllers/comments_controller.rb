class CommentsController < ApplicationController
  before_action :set_user

  def index
    @comment = Comment.new
  end

  def create
    @comment = @user.comments.new(comment_params)
    if @comment.save
      redirect_to user_comments_path(@user), 'コメントが送信されました'
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