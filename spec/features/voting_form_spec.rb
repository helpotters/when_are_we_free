require 'rails_helper'

RSpec.feature 'VotingForms', type: :feature do
  before do
    visit event_url(event.id)
  end
  context 'does fill required fields' do
  end
  context 'does not fill required fields' do
  end
end
