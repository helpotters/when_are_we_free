# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NotifyEmailJob do
  subject(:job) { described_class.new }

  describe '#perform' do
    let(:mailer) { instance_double(ActionMailer::MessageDelivery) }

    before do
      allow(VoterMailer).to receive(:send_confirmation_email_to).and_return(mailer)
      allow(mailer).to receive(:deliver_now!)
    end
      end

      it 'sends a confirmation email to them' do
        job.perform(1000)
        expect(mailer).to have_received(:deliver_now!)
      end
    end

    context 'when the user does not exist' do
      # before missing. no user created
      it 'does not send a confirmation email to them' do
        job.perform(1000)
        expect(mailer).not_to have_received(:deliver_now!)
      end
    end
  end
end
