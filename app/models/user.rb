class User < ActiveRecord::Base
  acts_as_taggable_on :tags
  validates :username, presence: true, uniqueness: true
  has_secure_password
  has_many :posts
  has_many :comments

end
