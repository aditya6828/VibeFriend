class User < ApplicationRecord
  has_one :my_profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
