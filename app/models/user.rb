class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments
  has_many :likes

  # custom method
  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
