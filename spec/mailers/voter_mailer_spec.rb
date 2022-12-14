# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VoterMailer do
  describe '#send_confirmation_email_to' do
    subject(:voter_email) { described_class.send_confirmation_email_to(@voter, @event.majority(@event.id)) }

    before(:each) do
      @event = create(:event)
      @voter = create(:confirmed_voter, email: 'test@example.com', event: @event)
      @voters = create_list(:confirmed_voter, 5, event: @event)
    end

    it 'renders the correct sender address' do
      expect(voter_email.from).to eq(['confirm@whenarewefree.com'])
    end

    it 'renders the correct subject' do
      expect(voter_email.subject).to eq('The votes are in!')
    end

    it 'renders the correct days' do
      majorities = @voter.event.majority(@event.id)

      majorities.each do |day|
        expect(voter_email.body.encoded).to include(day[0][1].to_s)
      end
    end

    it 'send the email to the correct address' do
      expect(voter_email.to).to eq(['test@example.com'])
    end
  end
end
