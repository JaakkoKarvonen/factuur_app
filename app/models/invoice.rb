class Invoice < ActiveRecord::Base

	belongs_to :contact
	belongs_to :user
	has_and_belongs_to_many :products
	has_many :fields, class_name: "ProductField"
	accepts_nested_attributes_for :fields, allow_destroy: true
	validates :date, presence: true
	#VALID_AMOUNT_REGEX = /\A[0-9]{1,}\z/i
	#validates :amount, format: { with: VALID_AMOUNT_REGEX }
end
