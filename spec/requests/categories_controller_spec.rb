require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @categories' do
      get :index
      expect(assigns(:categories)).not_to be_nil
    end
  end

  describe 'GET #show' do
    let(:category) do
      create(:category, user:)
    end
    it 'returns a success response' do
      get :show, params: { id: category.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end

    it 'assigns a new category as @category' do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe 'POST #create' do
    context 'with invalid parameters' do
      it 'does not create a new Category' do
        expect do
          post :create, params: { category: { name: nil } }
        end.to change(Category, :count).by(0)
      end

      it "renders the 'new' template" do
        post :create, params: { category: { name: nil } }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:category) { create(:category, user:) }

    it 'redirects to the categories list' do
      delete :destroy, params: { id: category.to_param }
      expect(response).to redirect_to(categories_url)
    end
  end
end
