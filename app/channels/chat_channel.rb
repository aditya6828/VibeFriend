class ChatChannel < ApplicationCable::Channel
  def subscribed
    if params[:chat_type] == 'private'
      stream_from "user_#{current_user.id}"
      stream_from "user_#{params[:user_id]}"
    elsif params[:chat_type] == 'group'
      stream_from "group_#{params[:group_id]}"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
