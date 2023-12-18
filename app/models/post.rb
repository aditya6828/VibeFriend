class Post < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  validates :comment, presence: true
  validates_associated :images
end
