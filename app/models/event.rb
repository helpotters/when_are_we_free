class Event < ApplicationRecord
  validates :title, length: { in: 2..100 }
  validates :description, length: { in: 0..100 }
  validates :start_date, presence: true
  validates :end_date, presence: true

  before_validation :clean_inputs, only: %i[title description]

  private

  def clean_inputs
    self.title = title.delete("\000") unless title.nil?
    self.description = description.delete("\000") unless description.nil?
  end
end
