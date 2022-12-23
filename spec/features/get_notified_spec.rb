# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Get Notified', type: :feature do
  let(:created_event) { create(:event) }
  let(:voter) { create(:voter, event: created_event) }

  context 'when submitting email' do
    before do
      create_cookie(:voter_id, voter.id)
      visit "notify/#{created_event.friendly_id}"
    end

    it 'adds email to contact list' do
      find(:test_id, 'email').fill_in(with: Faker::Internet.email)
      find(:test_id, 'submit').click
      expect(created_event.email_list(created_event.id).count).to eq(1)
    end
  end

  let(:full_event) { create(:event_with_minimum, minimum: 5, list_count: 4) }
  let(:mailer) { instance_double(ActionMailer::MessageDelivery) }

  context 'when minimum is reached' do
    before do
      allow(VoterMailer).to receive(:send_confirmation_email_to).and_return(mailer)
      allow(mailer).to receive(:deliver_now!)
    end
    it 'send emails' do
      expect(mailer).not_to have_received(:deliver_now!)
      voter = create(:confirmed_voter, event: full_event)
      expect(mailer).to have_received(:deliver_now!).exactly(5).times
    end
  end
end
