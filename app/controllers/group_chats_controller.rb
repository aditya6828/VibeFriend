class GroupChatsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @group_chats = GroupChat.all
    end
  
    def show
      @group_chat = GroupChat.find(params[:id])
      @messages = @group_chat.messages.order(created_at: :asc)
      @new_message = @group_chat.messages.build # Build a new message for the form
    end
  
    def new
      @group_chat = GroupChat.new
    end
  
    def create
      @group_chat = GroupChat.new(group_chat_params)
      if @group_chat.save
        flash[:notice] = "Group chat created successfully."
        redirect_to group_chats_path
      else
        flash[:alert] = "Group chat could not be created."
        render :new
      end
    end
  
    private
  
    def group_chat_params
      params.require(:group_chat).permit(:name)
    end
  end
  