class User < ActiveRecord::Base
  attr_accessible :tagname, :tag_list
  validates :username, presence: true, uniqueness: true
  has_secure_password
  has_many :posts
  has_many :comments
  has_many :user_tags
  has_many :tags, through: :user_tags

  def tag_list
    tags.map(&:tagname).join(", ")
  end

  def tag_list=(tagnames)
    self.tags = tagnames.split(",").map do |n|
      Tag.where(tagname: n.strip).first_or_create!
    end
  end
end
