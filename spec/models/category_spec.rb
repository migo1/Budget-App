require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password123')
    category = Category.new(
      name: 'Sample Category',
      image: 'sample.jpg',
      user:
    )
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password123')
    category = Category.new(
      image: 'sample.jpg',
      user:
    )
    expect(category).to_not be_valid
  end

  it 'is not valid without an image' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password123')
    category = Category.new(
      name: 'Sample Category',
      user:
    )
    expect(category).to_not be_valid
  end

  it 'belongs to a user' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password123')
    category = Category.create(name: 'Sample Category', image: 'sample.jpg', user:)
    expect(category.user).to eq(user)
  end

  it 'has many purchases through category_purchases' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password123')
    category = Category.create(name: 'Sample Category', image: 'sample.jpg', user:)
    purchase1 = Purchase.create(name: 'Purchase 1', amount: 100.0, author: user)
    purchase2 = Purchase.create(name: 'Purchase 2', amount: 50.0, author: user)
    CategoryPurchase.create(category:, purchase: purchase1)
    CategoryPurchase.create(category:, purchase: purchase2)
    expect(category.purchases).to include(purchase1, purchase2)
  end

  # You can add more tests as needed for your application.
end
