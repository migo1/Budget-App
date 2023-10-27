require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it 'is not valid without a name' do
    purchase = Purchase.new(
      amount: 100.0
    )
    expect(purchase).to_not be_valid
  end

  it 'is not valid without an amount' do
    purchase = Purchase.new(
      name: 'Sample Purchase'
    )
    expect(purchase).to_not be_valid
  end

  it 'belongs to an author (User)' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password123')
    purchase = Purchase.create(name: 'Sample Purchase', amount: 100.0, author: user)
    expect(purchase.author).to eq(user)
  end

  it 'has many categories through category_purchases' do
    purchase = Purchase.new(name: 'Sample Purchase', amount: 100.0)
    category1 = Category.create(name: 'Category 1')
    category2 = Category.create(name: 'Category 2')
    purchase.categories << [category1, category2]
    expect(purchase.categories).to include(category1, category2)
  end
end
