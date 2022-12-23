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

    context 'when the user exists' do
      before do
        create(:voter, id: 1000)
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
  describe '#email_event_members' do
    let(:mailer) { instance_double(ActionMailer::MessageDelivery) }

    before do
      allow(VoterMailer).to receive(:send_confirmation_email_to).and_return(mailer)
      allow(mailer).to receive(:deliver_now!)
    end
    context 'when expected party-size has joined' do
      before do
        create(:event_with_minimum, id: 1000)
      end
      it 'sends an email to every player' do
        # BRITTLE: Needs to confirm the emails?
        job.email_event_members(1000)
        expect(mailer).to have_received(:deliver_now!).at_least(5).times
      end
    end
  end
end
