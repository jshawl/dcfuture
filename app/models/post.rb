class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  # excellent advanced associations here!

  def post_tag_list
    tags.map(&:name).join(", ")
    # where did you learn this? AWESOME!!
  end

  def post_tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
