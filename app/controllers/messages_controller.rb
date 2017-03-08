class MessagesController < ApplicationController

  before_action :set_conversation

  def create
    receipt = User.last.reply_to_conversation(@conversation, params[:body])
    redirect_to conversation_path(receipt.conversation)
  end

  private

  def set_conversation
  @conversation = User.last.mailbox.conversations.find(params[:conversation_id])
  end


end
