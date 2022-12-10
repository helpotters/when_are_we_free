class VoterMailer < ApplicationMailer
  default from: 'confirm@whenarewefree.com'
  def send_confirmation_email_to(_voter)
    mail(
      subject: 'The votes are in!',
      template_name: 'confirm_session'
    )
  end
end
