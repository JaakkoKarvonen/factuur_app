class Setting < ActiveRecord::Base
  belongs_to :user
  validates :term, presence: true
  validates :user_id, presence: true
end
