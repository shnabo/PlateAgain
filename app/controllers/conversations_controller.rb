class ConversationsController < ApplicationController

  def index
    @conversations = User.first.mailbox.conversations
  end

  def show
    @conversation = User.first.mailbox.conversations.find(params[:id])

end
