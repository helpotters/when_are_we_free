class Event < ApplicationRecord
  extend FriendlyId
  validates :title, length: { in: 2..100 }
  validates :description, length: { in: 0..200 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  has_many :voters
  has_many :votes
  friendly_id :slug_candidates, use: :slugged

  before_validation :clean_inputs, only: %i[title description]

  def days
    arr = []
    (start_date..end_date).each.map { |day| arr << { start_time: day, end_time: day } }
    arr.map { |hsh| OpenStruct.new(hsh) }
  end

  def majority(id)
    vote_query = Event.where(id: id).joins(:votes).group('events.id').group('votes.day').count
    sorted_days = vote_query.sort_by { |_date, count| count }.reverse.to_a
  end

  def slug_candidates
    [
      :title,
      %i[title description],
      %i[title description end_date]
    ]
  end

  private

  def clean_inputs
    self.title = title.delete("\000") unless title.nil?
    self.description = description.delete("\000") unless description.nil?
  end
end
