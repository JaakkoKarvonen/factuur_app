class Setting < ActiveRecord::Base
  attr_accessor :currency, :term, :btw
  belongs_to :user
  validates :term, presence: true
end
