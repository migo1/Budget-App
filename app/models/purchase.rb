class Purchase < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :category_purchases
  has_many :categories, through: :category_purchases

  validates :name, presence: true
  validates :amount, presence: true
end
