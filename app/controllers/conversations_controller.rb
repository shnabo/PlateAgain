class ConversationsController < ApplicationController

  def index
    @conversations = User.last.mailbox.conversations
  end

  def show
    @conversation = User.last.mailbox.conversations.find(params[:id])
  end

  def new
  end

  def create
  end

end
