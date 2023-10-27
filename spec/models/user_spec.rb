require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(
      name: 'John Doe',
      email: 'john@example.com',
      password: 'password123'
    )
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(
      email: 'john@example.com',
      password: 'password123'
    )
    expect(user).to_not be_valid
  end

  it 'is not valid without a valid email' do
    user = User.new(
      name: 'John Doe',
      email: 'invalid_email',
      password: 'password123'
    )
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = User.new(
      name: 'John Doe',
      email: 'john@example.com'
    )
    expect(user).to_not be_valid
  end
end
