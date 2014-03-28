class Product < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :user
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 200 }
  validates :serial, presence: true, length: { maximum: 50 }
  validates :price, presence: true
end

