class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  has_secure_password
  has_many :posts
  has_many :comments
  has_one :location
end
