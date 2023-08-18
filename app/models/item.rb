class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

    validates :item_name, presence: true
    validates :item_text, presence: true
    validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
    validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
    validates :charge_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
    validates :area_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
    validates :scheduled_day_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
    validates :price, presence: true, numericality: { only_integer: true, message: 'use single-byte number' }
    validates :price, numericality: { greater_than: 299, message: 'must be greater than 299' }
    validates :price, numericality: { less_than: 10000000, message: 'must be less than 10000000' }
    validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :area
  belongs_to :scheduled_day
end

