class Invoice < ActiveRecord::Base
	has_and_belongs_to_many :contacts
	validates :contactid, presence: true
	validates :date, presence: true
	validates :productid, presence: true
	VALID_AMOUNT_REGEX = /\A[0-9]{1,}\z/i
	validates :amount, format: { with: VALID_AMOUNT_REGEX }
end
