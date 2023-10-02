require 'rails_helper'

RSpec.describe User, type: :model do
  it 'returns three most recent posts' do
    user = User.create(username: 'john_doe', email: 'john@example.com', password: 'password123')

    # Create some posts for the user
    4.times { |i| user.posts.create(title: "Post #{i}", body: "Body #{i}") }

    recent_posts = user.three_most_recent_posts

    expect(recent_posts.length).to eq(3)
    expect(recent_posts.first.title).to eq('Post 3')
    expect(recent_posts.last.title).to eq('Post 1')
  end

  describe 'Validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_numericality_of(:post_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'Associations' do
    it { should have_many(:posts).with_foreign_key('author_id') }
    it { should have_many(:comments).with_foreign_key('author_id') }
    it { should have_many(:likes) }
  end

  describe '#three_most_recent_posts' do
    let(:user) { create(:user) }
    let!(:old_post) { create(:post, author: user, created_at: 1.year.ago, body: 'Sample content') }

    let!(:recent_posts) { create_list(:post, 3, author: user, created_at: Time.now) }

    it 'returns the three most recent posts' do
      expected_posts = recent_posts.sort_by(&:created_at).reverse.map(&:to_json)
      actual_posts = user.three_most_recent_posts.to_a.sort_by(&:created_at).reverse.map(&:to_json)

      expect(actual_posts).to eq(expected_posts)
    end
  end
end
