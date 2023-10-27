require 'rails_helper'

RSpec.feature 'Home Page', type: :feature do
  scenario 'User visits the home page' do
    visit root_path

    expect(page).to have_selector('header.bg-blue-500 h1', text: 'BUDGET APP')
    expect(page).to have_selector('main p', text: 'Welcome to your Budget App !')
  end
end
