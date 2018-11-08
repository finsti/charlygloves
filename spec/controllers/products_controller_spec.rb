require 'rails_helper'

describe ProductsController, type: :controller do

  before do
    @product = FactoryBot.create(:product)
    @admin = FactoryBot.create(:admin)
    @user = FactoryBot.create(:user)
  end

  ### begin index ###

  context 'GET #index' do
    it 'renders the product overview' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  ### end index ###
  ### begin show ###

  context 'GET #show' do
    it 'shows a product\'s details' do
      get :show, params: {id: @product.id }
      expect(response).to be_ok
      expect(response).to render_template('show')
    end
  end

  ### end show ###
  ### begin new ###

  describe 'GET #new' do
    context "when an admin is logged in" do
      before do
        sign_in @admin
      end
      it 'shows a new product page' do
        get :new
        expect(response).to render_template('new')
      end
    end

    context 'when a user is logged in' do
      before do
        sign_in @user
      end
      it 'shows a new product page' do
        get :new
        expect(response).to render_template('new')
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login page' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  ### end new ###
  ### begin edit ###

  describe 'GET #edit' do
    context 'when an admin is logged in' do
      before do
        sign_in @admin
      end
      it 'shows the edit product page' do
        get :edit, params: { id: @product.id }
        expect(assigns(:product)).to eq @product
        expect(response).to render_template('edit')
      end
    end

    context 'when a user is logged in' do
      before do
        sign_in @user
      end
      it 'shows the edit product page' do
        get :edit, params: { id: @product.id }
        expect(assigns(:product)).to eq @product
        expect(response).to render_template('edit')
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login page' do
        get :edit, params: { id: @product.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  ### end edit ###
  ### begin create ###

  describe 'POST #create' do

    context 'when a product is created' do

      it 'is valid with a name' do
        expect(Product.new(name: 'Glove')).to be_valid
      end

      it 'is not valid without a name' do
        expect(Product.new(name: '')).not_to be_valid
      end

    end
  end

  ### end create ###

  ### begin destroy ###

  describe 'DELETE #destroy' do
    before do
        sign_in @admin
    end
    it 'destroys a product' do
        delete :destroy, params: {id: @product}
        expect(response).to redirect_to products_path
    end
  end

  ### end destroy ###

end
