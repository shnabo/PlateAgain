class CommentsController < ApplicationController

    def show
      @user = User.find(params[:user_id])
      @user = @user.comments.all
    end

    def create
        @user = User.find(params[:user_id])
        @comment = @user.comments.create(comment_params)
      if @comment.save
        redirect_to user_path(@user)
      else
        render :back
      end
    end

    def destroy
      @user = User.find(params[:user_id])
      @comment = @user.comments.find(params[:id])
      @comment.destroy
      redirect_to user_path(@user)
    end




      private

    def comment_params
      params.require(:comment).permit(:comments)
    end

end
