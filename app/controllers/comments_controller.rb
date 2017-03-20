class CommentsController < ApplicationController

  def show
    find_user
  end

  def edit
    find_user
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
    end
    redirect_to user_path( params[ :user_id ] )
  end


  def create
    find_user
    @comment = @user.comments.create(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_path(@user), notice: "Review posted successfully!" }
        format.js {}
      else
        redirect_back(fallback_location: root_path)
      end
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
