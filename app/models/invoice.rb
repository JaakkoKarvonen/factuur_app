class Invoice < ActiveRecord::Base
	belongs_to :contact
	belongs_to :product
	validates :contact_id, presence: true
	validates :date, presence: true
	validates :product_id, presence: true
	VALID_AMOUNT_REGEX = /\A[0-9]{1,}\z/i
	validates :amount, format: { with: VALID_AMOUNT_REGEX }
end
