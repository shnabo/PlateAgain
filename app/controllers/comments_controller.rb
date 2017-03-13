class CommentsController < ApplicationController

  def show
    find_user
  end

  def create
    find_user
    @comment = @user.comments.create(comment_params)
    if @comment.save
      redirect_to user_path(@user)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    find_user
    @comment = @user.comments.find(params[:id])
    @comment.destroy
    redirect_to user_path(@user)
  end




private

  def comment_params
    params.require(:comment).permit(:comments, :reviewer_id)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

end
