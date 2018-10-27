require 'rails_helper'

describe UsersController, type: :controller do

  let(:user) { User.create!(email: "test@test.de", password: "password") }
  let(:user2) { User.create!(email: "test2@test2.de", password: "password2") }

  describe 'GET #show' do

     context 'when a user is logged in' do

       before do
         sign_in user
       end

       it 'loads correct user details' do
         get :show, params: { id: user.id }
         expect(assigns(:user)).to eq user
       end

       it 'denies access to another person\'s user details and redirects to root path' do
         get :show, params: { id: user2.id }
         expect(response).to have_http_status(302)
         expect(response).to redirect_to(root_path)
       end

     end

     context 'when a user is not logged in' do
       it 'redirects to root path' do
         get :show, params: { id: user.id }
         expect(response).to redirect_to(root_path)
       end
     end

  end

end
