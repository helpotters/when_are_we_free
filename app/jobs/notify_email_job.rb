# frozen_string_literal: true

class NotifyEmailJob < ApplicationJob
  def perform(voter_id, majority_days = [])
    voter = Voter.find_by(id: voter_id)
    VoterMailer.send_confirmation_email_to(voter).deliver_now! if voter.present?
  end
end
