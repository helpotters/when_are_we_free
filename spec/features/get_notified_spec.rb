# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Get Notified', type: :feature do
  let(:event) { create(:event) }

  context 'submit email as contact' do
    before do
      visit "notify/#{event.id}"
    end

    it 'should add email to event contact list' do
      find(:test_id, 'email').fill_in(with: Faker::Internet.email)
      find(:test_id, 'submit').click
      expect(event.email_list).to eq(1)
    end
  end

  xcontext 'before minimum is reached' do
  end

  xcontext 'after minimum is reached' do
  end
end
