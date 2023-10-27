require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }
  let(:valid_attributes) { { name: 'Test Purchase', amount: 100 } }
  let(:invalid_attributes) { { name: '', amount: 0 } }
  let(:valid_session) { {} }

  before do
    sign_in(user)
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: { category_id: category.to_param }
      expect(response).to be_successful
    end

    it 'assigns a new purchase as @purchase' do
      get :new, params: { category_id: category.to_param }
      expect(assigns(:purchase)).to be_a_new(Purchase)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Purchase' do
        expect do
          post :create, params: { purchase: valid_attributes, category_id: category.to_param }
        end.to change(Purchase, :count).by(1)
      end

      it 'redirects to the category' do
        post :create, params: { purchase: valid_attributes, category_id: category.to_param }
        expect(response).to redirect_to(category_url(category))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Purchase' do
        expect do
          post :create, params: { purchase: invalid_attributes, category_id: category.to_param }
        end.to change(Purchase, :count).by(0)
      end

      it "renders the 'new' template" do
        post :create, params: { purchase: invalid_attributes, category_id: category.to_param }
        expect(response).to render_template('new')
      end
    end
  end
end
