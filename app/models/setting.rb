class Setting < ActiveRecord::Base
  attr_accessor :currency, :term, :conditions, :btw
  belongs_to :user

end
