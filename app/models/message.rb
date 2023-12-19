class Message < ApplicationRecord
  belongs_to :user
  belongs_to :friend_request
  belongs_to :group_chat
end
