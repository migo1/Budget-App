class Category < ApplicationRecord
  belongs_to :user

  has_many :category_purchases
  has_many :purchases, through: :category_purchases

  validates :name, presence: true
  validates :image, presence: true
end
