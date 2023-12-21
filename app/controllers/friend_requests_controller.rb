class FriendRequestsController < ApplicationController
    before_action :authenticate_user!

    def index
      @friend_requests = current_user.received_friend_requests
    end
  
    def new
      @recipient = User.find(params[:recipient_id])
      @friend_request = FriendRequest.new
    end
  
    def create
      friend = User.find(params[:friend_id])
      if current_user.send_friend_request(friend)
        flash[:notice] = "Friend request sent successfully."
      else
        flash[:alert] = "Friend request could not be sent."
      end
      redirect_back(fallback_location: root_path)
    end
  
    def update
      friend_request = FriendRequest.find(params[:id])
      if current_user.accept_friend_request(friend_request)
        flash[:notice] = "Friend request accepted."
      else
        flash[:alert] = "Friend request could not be accepted."
      end
      redirect_back(fallback_location: root_path)
    end
  
    def show
      @friend_request = FriendRequest.find(params[:id])
    end

    def destroy
      friend_request = FriendRequest.find(params[:id])
      if current_user.reject_friend_request(friend_request)
        flash[:notice] = "Friend request rejected."
      else
        flash[:alert] = "Friend request could not be rejected."
      end
      redirect_back(fallback_location: root_path)
    end
end
  