require 'rails_helper'

RSpec.describe User, type: :model do
  it "returns three most recent posts" do
    user = User.create(username: "john_doe", email: "john@example.com", password: "password123")

    # Create some posts for the user
    4.times { |i| user.posts.create(title: "Post #{i}", body: "Body #{i}") }

    recent_posts = user.three_most_recent_posts

    expect(recent_posts.length).to eq(3)
    expect(recent_posts.first.title).to eq("Post 3")
    expect(recent_posts.last.title).to eq("Post 1")
  end
end
