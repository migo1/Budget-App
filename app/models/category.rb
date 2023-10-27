class Category < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :image, presence: true
end
