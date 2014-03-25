class Product < ActiveRecord::Base
  has_and_belongs_to_many :invoices
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 200 }
  validates :serial, presence: true, length: { maximum: 50 }
  validates :price, presence: true
end

