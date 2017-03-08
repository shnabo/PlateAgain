class MessagesController < ApplicationController

  before_action :set_conversation

  def create
    receipt = User.first.reply_to_conversation(@conversation, body)
    redirect_to receipt.conversation
  end

  private

  def set_conversation
  @conversation = User.first.mailbox.conversations.find(params[:conversation_id])
  end


end
