class Vote < ApplicationRecord
  validates_presence_of :day,
                        date: { after: proc { Date.current_time },
                                message: 'must be within range' }
  belongs_to :voter
  belongs_to :event
end
