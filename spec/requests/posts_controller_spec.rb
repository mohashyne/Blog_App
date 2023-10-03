# spec/controllers/posts_controller_spec.rb
require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }

  describe 'GET #index' do
    it 'assigns @posts and renders the index template' do
      get :index, params: { user_id: user.id }

      expect(assigns(:posts)).to eq(user.posts)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns @post and renders the show template' do
      get :show, params: { id: post.id }

      expect(assigns(:post)).to eq(post)
      expect(response).to render_template(:show)
    end
  end
end
