require 'rails_helper'

RSpec.feature 'Event Creation', type: :feature do
  before do
    visit root_path
  end

  context 'when filling in with valid title and description' do
    it 'creates an event successfully' do
      find(:test_id, 'title_field').fill_in(with: 'DnD Session')
      find(:test_id, 'description_field').fill_in(with: 'Facing the final boss')
      find(:test_id, 'submit_btn').click

      expect(find(:test_id, 'event_title')).to have_content('DnD Session')
    end
  end

  context 'when filled in with empty description' do
    it 'creates an event successfully' do
      find(:test_id, 'title_field').fill_in(with: 'DnD Session')
      find(:test_id, 'description_field').fill_in(with: '')
      find(:test_id, 'submit_btn').click

      expect(find(:test_id, 'event_title')).to have_content('DnD Session')
    end
  end

  context 'when filled in with empty values' do
    it 'validates the event fields' do
      find(:test_id, 'title_field').fill_in(with: '')
      find(:test_id, 'description_field').fill_in(with: '')
      find(:test_id, 'submit_btn').click

      expect(page).to have_content('cannot be empty')
    end
  end
end
