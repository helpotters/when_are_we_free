class VoterMailer < ApplicationMailer
  default from: 'confirm@whenarewefree.com'
  def send_confirmation_email_to(voter)
    mail(
      subject: 'The votes are in!',
      to: voter.email,
      template_name: 'confirm_session'
    )
  end
end
