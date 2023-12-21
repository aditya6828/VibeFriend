# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  def create
    @group_chat = GroupChat.find(params[:group_chat_id])
    @message = @group_chat.messages.create(message_params)
    redirect_to group_chat_path(@group_chat)
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end
