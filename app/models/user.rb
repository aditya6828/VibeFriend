class User < ApplicationRecord
  has_one :my_profile
  has_many_attached :images
  has_many :posts
  has_many :friendships
  has_many :sent_friend_requests, class_name: 'FriendRequest', foreign_key: 'sender_id'
  has_many :received_friend_requests, class_name: 'FriendRequest', foreign_key: 'recipient_id'
  has_many :friends, through: :friendships
  has_many :group_chats, through: :group_memberships

  def send_friend_request(recipient)
    sent_friend_requests.create(recipient: recipient)
  end

  def accept_friend_request(friend_request)
    friendship = Friendship.create(user: self, friend: friend_request.sender, accepted: true)
    friend_request.update(accepted: true)
    friendship.valid? && friend_request.valid?
  end

  def reject_friend_request(friend_request)
    friend_request.update(accepted: false)
  end
  

  validates :caption, length: { maximum: 255 }
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end
