class Tag < ActiveRecord::Base
  has_many :user_tags
  has_many :users, through: :user_tags
  has_many :post_tags
  has_many :posts, through: :post_tags

  def self.tagged_with_user(name)
   Tag.find_by_name!(name).users
  end

 def self.tag_user_counts
   Tag.select("tags.*, count(user_tags.tag_id) as count").
     joins(:user_tags).group("user_tags.tag_id")
 end

 def self.tagged_with_post(name)
  Tag.find_by_name!(name).posts
 end

def self.tag_post_counts
  Tag.select("tags.*, count(post_tags.tag_id) as count").
    joins(:post_tags).group("post_tags.tag_id")
end

end
