class Voter < ApplicationRecord
  after_create :check_if_minimum_met
  after_update :check_if_minimum_met

  validates :name, presence: true, uniqueness: { scope: :event_id, case_sensitive: false }
  validates_length_of :name, minimum: 1, message: 'is too short (minimum is 1 character)'
  validates_length_of :name, maximum: 26, message: 'is too long (maximum is 26 characters)'

  validates :email, allow_nil: true, uniqueness: { scope: :event_id }, format: { with: URI::MailTo::EMAIL_REGEXP }

  belongs_to :event
  has_many :votes

  accepts_nested_attributes_for :votes, allow_destroy: true, reject_if: proc { |vote|
                                                                          true unless vote.key?('day')
                                                                        }

  private

  def check_if_minimum_met
    event = Event.find_by(id: event_id)
    voters = event.voters.count
    minimum = event.minimum
    NotifyEmailJob.new.email_event_members(event_id) if voters >= minimum
  end
end
