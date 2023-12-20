class User < ApplicationRecord
  has_one :my_profile
  has_many_attached :images
  has_many :posts
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :group_chats, through: :group_memberships

  validates :caption, length: { maximum: 255 }
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end
