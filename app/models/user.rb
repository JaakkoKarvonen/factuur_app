class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  has_one :setting
  has_one :profile
  has_many :contacts
  has_many :invoices
  has_many :products
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
  			uniqueness: { case_sensitive: false }
  has_secure_password
  has_one :setting
  validates :password, length: { minimum: 6 }
  #has_settings :currency, :term, :conditions, :btw
  serialize :settings, Setting

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def settings
    if read_attribute(:settings).nil?
      write_attribute :settings, Setting.new
      read_attribute :settings
    else
      read_attribute :settings
    end
  end

  def settings=(val)
    write_attribute :settings, val
  end

  
  private

    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end
end
