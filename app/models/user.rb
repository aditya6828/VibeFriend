class User < ApplicationRecord
  has_one :my_profile
  has_many_attached :images
  validates :caption, length: { maximum: 255 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
