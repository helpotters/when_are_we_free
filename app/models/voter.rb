class Voter < ApplicationRecord
  validates :name, presence: :true, uniqueness: { scope: :event_id }
  validates_length_of :name, minimum: 1, message: 'is too short (minimum is 1 character)'
  validates_length_of :name, maximum: 26, message: 'is too long (maximum is 26 characters)'

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  belongs_to :event
  has_many :votes

  accepts_nested_attributes_for :votes, allow_destroy: true, reject_if: proc { |vote|
                                                                          true unless vote.key?('day')
                                                                        }
end
