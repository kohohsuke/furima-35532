class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
    with_options numericality: { other_than: 0, message: 'Select' } do
      validates :category_id
      validates :status_id
      validates :shipping_free_id
      validates :prefecture_id
      validates :schedule_id
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_free
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :schedule
end
