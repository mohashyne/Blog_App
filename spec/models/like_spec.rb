require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(username: 'john_doe', email: 'john@example.com', password: 'password123') }
  let(:post) { Post.create(title: 'Sample Post', body: 'This is a sample post', user:) }

  it 'updates likes_counter after saving a like' do
    like = Like.new(user:, post:)
    like.save

    # Reload post to get the latest likes_counter value
    post.reload

    expect(post.likes_counter).to eq(1)
  end
end
