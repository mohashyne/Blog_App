require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(username: 'john_doe', email: 'john@example.com', password: 'password123') }
  let(:post) { Post.create(title: 'Sample Post', body: 'This is a sample post', author: user) }

  it 'updates likes_counter after saving a like' do
    like = Like.new(user:, post:)
    like.save

    # Reload post to get the latest likes_counter value
    post.reload

    expect(post.likes_counter).to eq(1)
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe '#update_likes_counter' do
    it 'updates the post\'s likes_counter' do
      create(:like, post:, user:)
      expect { create(:like, post:, user:) }.to change {
        post.reload.likes_counter
      }.by(1)
    end
  end
end
