# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VoterMailer do
  describe '#send_confirmation_email_to' do
    subject(:voter_email) { described_class.send_confirmation_email_to(voter) }

    let(:voter) { create(:voter, email: 'test@example.com') }

    it 'renders the correct sender address' do
      expect(voter_email.from).to eql(['confirm@whenarewefree.com'])
    end
  end
end
