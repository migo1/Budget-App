require 'rails_helper'

RSpec.feature 'Category Create Page', type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'User creates a new category' do
    visit new_category_path

    fill_in 'name', with: 'New Category Name'
    attach_file 'file_input', "#{Rails.root}/spec/support/sample.jpg"

    click_button 'Save'

    expect(page).to have_text('Category was successfully created.')
  end

  scenario 'User creates a new category with invalid data' do
    visit new_category_path

    click_button 'Save'

    expect(page).to have_text('prohibited this category from being saved')
  end
end
