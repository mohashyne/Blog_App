require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(username: "john_doe", email: "john@example.com", password: "password123") }
  let(:post) { Post.create(title: "Sample Post", body: "This is a sample post", user: user) }

  it "updates comments_counter after saving a comment" do
    comment = Comment.new(user: user, post: post)
    comment.save

    # Reload post to get the latest comments_counter value
    post.reload

    expect(post.comments_counter).to eq(1)
  end
end

