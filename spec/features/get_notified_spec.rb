# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Get Notified', type: :feature do
  let(:created_event) { create(:event) }
  let(:voter) { create(:voter, event: created_event) }

  context 'submit email as contact' do
    before do
      create_cookie(:voter_id, voter.id)
      visit "notify/#{created_event.friendly_id}"
    end

    it 'should add email to created_event contact list' do
      find(:test_id, 'email').fill_in(with: Faker::Internet.email)
      find(:test_id, 'submit').click
      expect(created_event.email_list(created_event.id).count).to eq(1)
    end
  end

  context 'after minimum is reached' do
    let(:full_event) { create(:event_with_minimum, minimum: 5, list_count: 4) }

    let(:mailer) { instance_double(ActionMailer::MessageDelivery) }

    before do
      allow(VoterMailer).to receive(:send_confirmation_email_to).and_return(mailer)
      allow(mailer).to receive(:deliver_now!)
    end
    it 'send emails once minimum is reached' do
      expect(mailer).not_to have_received(:deliver_now!)
      create(:voter, event: full_event)
      expect(mailer).to have_received(:deliver_now!)
    end
  end

  xcontext 'before minimum is reached' do
  end
end
