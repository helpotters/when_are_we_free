# frozen_string_literal: true

class NotifyEmailJob < ApplicationJob
  def perform(voter_id, majority_days = [])
    voter = Voter.find_by(id: voter_id)

    VoterMailer.send_confirmation_email_to(voter, majority_days).deliver_now! if voter.present?
  end

  def email_event_members(event_id)
    event = Event.find_by(id: event_id)
    majority_days = event.majority(event_id)
    event.voters.each do |voter|
      perform(voter, majority_days)
    end
  end
end
