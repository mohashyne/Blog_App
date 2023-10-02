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

  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe '#update_likes_counter' do
    it 'updates the post\'s likes_counter' do
      # rubocop:disable Style/HashSyntax
      create(:like, post: post, user: user)
      expect { create(:like, post: post, user: user) }.to change {
        # rubocop:enable Style/HashSyntax
        post.reload.likes_counter
      }.by(1)
    end

  end
end
