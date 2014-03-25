class Setting < ActiveRecord::Base
  attr_accessor :currency, :term, :conditions, :btw
  belongs_to :user
  validates :term, presence: true, length: { maximum: 150 }
  validates :conditions, presence: true, length: { maximum: 300 }
end
