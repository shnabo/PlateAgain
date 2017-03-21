class MessagesController < ApplicationController

  before_action :set_conversation

  def show
    @user && current_user
  end

  def create
    @receipt = current_user.reply_to_conversation(@conversation, params[:body])

    respond_to do |format|
      # if receipt.save
        format.js { render 'conversations/create' }
        # redirect_to conversation_path(receipt.conversation)
      # end
    end
  end

private

  def set_conversation
    @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
  end


end
