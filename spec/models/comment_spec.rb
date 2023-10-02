require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe '#update_comments_counter' do
    it 'updates the post\'s comments_counter' do
      # rubocop:disable Style/HashSyntax
      create(:comment, post: post, user: user)
      expect { create(:comment, post: post, user: user) }.to change {
        post.reload.comments_counter
      }.by(1)
      # rubocop:enable Style/HashSyntax
    end
  end
end
