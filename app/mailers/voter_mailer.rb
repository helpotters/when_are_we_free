class VoterMailer < ApplicationMailer
  default from: 'paullemus@protonmail.com'
  def send_confirmation_email_to(voter, majority = [])
    @voter = voter
    @majority = majority
    @event = Event.find(@voter.event_id)
    mail(
      subject: 'The votes are in!',
      to: voter.email,
      template_name: 'confirm_session'
    )
  end
end
