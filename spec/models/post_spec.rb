require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:author) { User.create(username: 'john_doe', email: 'john@example.com', password: 'password123') }

  it 'updates post_counter after saving a post' do
    author.posts.create(title: 'Sample Post', body: 'This is a sample post')

    # Reload author to get the latest post_counter value
    author.reload

    expect(author.post_counter).to eq(1)
  end

  it 'returns five most recent comments' do
    post = author.posts.create(title: 'Sample Post', body: 'This is a sample post')

    # Create some comments for the post
    6.times { |i| post.comments.create(body: "Comment #{i}", user: author) }

    recent_comments = post.five_most_recent_comments

    expect(recent_comments.length).to eq(5)
    expect(recent_comments.first.body).to eq('Comment 5')
    expect(recent_comments.last.body).to eq('Comment 1')
=======
  let(:user) { create(:user) }

  describe 'Associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key(:author_id) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe '#five_most_recent_comments' do
    it 'returns the five most recent comments for the post' do
      post = create(:post, author: user)
      # rubocop:disable Style/HashSyntax
      create_list(:comment, 5, post: post, created_at: 1.month.ago)
      recent_comments = create_list(:comment, 5, post: post)
      # rubocop:enable Style/HashSyntax
      expected_comment_ids = recent_comments.pluck(:id).sort.reverse
      actual_comment_ids = post.five_most_recent_comments.pluck(:id).sort.reverse

      expect(actual_comment_ids).to eq(expected_comment_ids)
    end
  end

  describe '#update_post_counter' do
    it 'updates the author\'s post_counter' do
      create(:post, author: user)
      expect { create(:post, author: user) }.to change { user.reload.post_counter }.by(1)

  end
end
