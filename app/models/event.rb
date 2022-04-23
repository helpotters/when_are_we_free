class Event < ApplicationRecord
  validates :title, length: { in: 2..100 }
  validates :description, length: { in: 2..100 }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
