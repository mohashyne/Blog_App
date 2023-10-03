require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }

  describe 'Associations' do
    it 'belongs to a user (author)' do
      association = described_class.reflect_on_association(:author)
      expect(association.macro).to eq :belongs_to
    end

    it 'belongs to a post' do
      association = described_class.reflect_on_association(:post)
      expect(association.macro).to eq :belongs_to
    end
  end

  describe '#update_comments_counter' do
    it 'updates the post\'s comments_counter' do
      comment = create(:comment, post: post, author: user)
      post.reload

      expect(post.comments_counter).to eq(1)
    end
  end
end
