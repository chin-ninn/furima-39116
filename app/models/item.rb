class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase
  has_one_attached :image

  validates :item_name, presence: true
  validates :item_text, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :charges_id, presence: true
  validates :area_id, presence: true
  validates :days_id, presence: true
  validates :price, presence: true
end
