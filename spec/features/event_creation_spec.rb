require 'rails_helper'

RSpec.feature 'Event Creation', type: :feature do
  before do
    visit root_path
  end

  context 'when filling in with valid title and description week event' do
    it 'creates an event successfully' do
      find(:test_id, 'title_field').fill_in(with: Faker::Kpop.iii_groups)
      find(:test_id, 'description_field').fill_in(with: Faker::String.random)
      find(:test_id, 'week_event').click

      expect(find(:test_id, 'event_title')).to have_content('DnD Session')
    end
  end

  context 'when filling in with valid title and description and selecting month event' do
    it 'creates an event successfully' do
      find(:test_id, 'title_field').fill_in(with: Faker::Kpop.iii_groups)
      find(:test_id, 'description_field').fill_in(with: Faker::String.random)
      find(:test_id, 'month_event').click

      expect(find(:test_id, 'event_title')).to have_content('DnD Session')
    end
  end

  context 'when filled in with empty description' do
    it 'creates an event successfully' do
      find(:test_id, 'title_field').fill_in(with: 'DnD Session')
      find(:test_id, 'description_field').fill_in(with: '')
      find(:test_id, 'week_event').click

      expect(find(:test_id, 'event_title')).to have_content('DnD Session')
    end
  end

  context 'when filled in with empty values' do
    it 'validates the event fields' do
      find(:test_id, 'title_field').fill_in(with: '')
      find(:test_id, 'description_field').fill_in(with: '')
      find(:test_id, 'week_event').click

      expect(page).to have_content('cannot be empty')
    end
  end
end
