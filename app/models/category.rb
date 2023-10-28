class Category < ApplicationRecord
  belongs_to :user

  has_many :category_purchases
  has_many :purchases, through: :category_purchases

  validates :name, presence: true
  validates :image, presence: true

  def total_sum
    purchases.sum(:amount)
  end

  before_destroy :delete_associated_purchases

  private

  def delete_associated_purchases
    purchases.destroy_all
  end
end
