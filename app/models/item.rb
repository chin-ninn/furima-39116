class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase
  has_one_attached :image

  validates :item_name, presence: true
  validates :item_text, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :charges_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :area_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :days_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :price, presence: true
  validates :image, presence: true

  extend ActiveHash::Association::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charges
  belongs_to :area
  belongs_to :days
end
