class Tag < ActiveRecord::Base
  has_many :user_tags
  has_many :users, through: :user_tags

  def self.tagged_with(name)
   Tag.find_by_name!(name).users
 end

 def self.tag_counts
   Tag.select("tags.*, count(user_tags.tag_id) as count").
     joins(:user_tags).group("user_tags.tag_id")
 end

end
