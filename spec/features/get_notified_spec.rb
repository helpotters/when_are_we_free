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

  xcontext 'before minimum is reached' do
  end

  xcontext 'after minimum is reached' do
  end
end
