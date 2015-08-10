class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  has_secure_password
  has_many :posts
  has_many :comments
  has_many :user_tags, dependent: :destroy
  has_many :tags, through: :user_tags

  def user_tag_list
    tags.map(&:name).join(", ")
  end

  def user_tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

end
