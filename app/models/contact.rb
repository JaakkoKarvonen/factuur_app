class Contact < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :company, length: { maximum: 50 }
	validates :name,  presence: true, length: { maximum: 100 }
	validates :address,  presence: true
	VALID_POSTCODE_REGEX = /\A[0-9]{4}+[a-zA-Z]{2}\z/i
	validates :postcode,  presence: true, format: { with: VALID_POSTCODE_REGEX }
	validates :city,  presence: true, length: { maximum: 30 }
	VALID_KVK_REGEX = /\A[0-9]{8}\z/i
	validates :kvk, format: { with: VALID_KVK_REGEX }
	VALID_BTW_REGEX = /\A[0-9]{9}+B+[0-9]{2}\z/i
	validates :btw, format: { with: VALID_BTW_REGEX }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	VALID_ACCOUNT_REGEX = /\ANL+[0-9]{2}+[A-Z]{4}+[0-9]{10}\z/i
	validates :account, format: { with: VALID_ACCOUNT_REGEX }
end
