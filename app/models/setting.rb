class Setting < ActiveRecord::Base
  attr_accessor :currency, :term, :conditions, :btw
  belongs_to :user

  def initialize
  	@currency = nil
  	@term = nil
  	@conditions = nil
  	@btw = nil
  end
end
