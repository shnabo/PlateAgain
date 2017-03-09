class ConversationsController < ApplicationController

  def index
    if current_user
      @conversations = current_user.mailbox.conversations
    else
    redirect_back(fallback_location: root_path)
    end
  end

  def show
    @conversation = current_user.mailbox.conversations.find(params[:id])
  end

  def new
    @recipients = User.all - [current_user]
  end

  def create
      @recipient = User.find(params[:user_id])
      receipt =  current_user.send_message(@recipient, params[:body], params[:subject])
      redirect_to conversation_path(receipt.conversation)
  end

end
