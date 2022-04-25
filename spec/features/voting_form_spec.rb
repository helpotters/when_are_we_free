require 'rails_helper'

RSpec.feature 'VotingForms', type: :feature do
  let(:event) { create(:event) }

  before do
    visit "events/#{event.id}"
  end

  context 'does not fill required fields' do
  end
  context 'does fill required fields' do
  end
end
