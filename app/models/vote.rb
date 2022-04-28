class Vote < ApplicationRecord
  validates_presence_of :day
  belongs_to :voter
  belongs_to :event
end
