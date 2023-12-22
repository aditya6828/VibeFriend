class Message < ApplicationRecord
  belongs_to :user
  belongs_to :friend_request, optional: true
  belongs_to :group_chat
end
