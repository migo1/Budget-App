require 'rails_helper'

RSpec.describe CategoryPurchase, type: :model do
  it 'belongs to a category' do
    category = Category.create(name: 'Sample Category', image: 'sample.jpg',
                               user: User.create(name: 'John Doe', email: 'john@example.com', password: 'password123'))
    purchase = Purchase.create(name: 'Sample Purchase', amount: 100.0,
                               author: User.create(name: 'Alice', email: 'alice@example.com', password: 'password456'))
    category_purchase = CategoryPurchase.create(category:, purchase:)
    expect(category_purchase.category).to eq(category)
  end

  it 'belongs to a purchase' do
    category = Category.create(name: 'Sample Category', image: 'sample.jpg',
                               user: User.create(name: 'John Doe', email: 'john@example.com', password: 'password123'))
    purchase = Purchase.create(name: 'Sample Purchase', amount: 100.0,
                               author: User.create(name: 'Alice', email: 'alice@example.com', password: 'password456'))
    category_purchase = CategoryPurchase.create(category:, purchase:)
    expect(category_purchase.purchase).to eq(purchase)
  end
end
