# spec/controllers/users_controller_spec.rb
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    it 'assigns @users and renders the index template' do
      get :index

      expect(assigns(:users)).to eq(User.all)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns @user and renders the show template' do
      get :show, params: { id: user.id }

      expect(assigns(:user)).to eq(user)
      expect(response).to render_template(:show)
    end
  end
end
# spec/controllers/users_controller_spec.rb
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    it 'assigns @users and renders the index template' do
      get :index

      expect(assigns(:users)).to eq(User.all)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns @user and renders the show template' do
      get :show, params: { id: user.id }

      expect(assigns(:user)).to eq(user)
      expect(response).to render_template(:show)
    end
  end
end
