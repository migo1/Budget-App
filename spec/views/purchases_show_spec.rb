require 'rails_helper'

RSpec.feature 'Purchase Show Page', type: :feature do
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }
  let(:purchase) { create(:purchase, categories: [category]) }

  before do
    sign_in user # Sign in the user
  end

  scenario 'User views a purchase' do
    visit category_purchase_path(category, purchase)

    expect(page).to have_selector('p', text: 'Categories:')
    expect(page).to have_selector('p', text: category.name)
  end
end
