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
  end
end
