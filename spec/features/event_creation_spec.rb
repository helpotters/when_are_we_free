require 'rails_helper'

RSpec.feature 'Event Creation', type: :feature do
  let(:title) { Faker::Kpop.iii_groups }
  before do
    visit new_event_path
    find(:test_id, 'minimum_field').set(5)
  end

  context 'when selecting week' do
    it 'create event successfully' do
      find(:test_id, 'title_field').fill_in(with: title)
      find(:test_id, 'description_field').fill_in(with: 'Description, hello')
      find(:test_id, 'week_event').click

      expect(find(:test_id, 'event_title')).to have_content(title)
    end
  end

  context 'when selecting month' do
    it 'creates an event successfully' do
      find(:test_id, 'title_field').fill_in(with: title)
      find(:test_id, 'description_field').fill_in(with: 'A description beyond understanding')
      find(:test_id, 'month_event').click

      expect(find(:test_id, 'event_title')).to have_content(title)
    end
  end

  context 'when created without a description' do
    it 'creates an event successfully' do
      find(:test_id, 'title_field').fill_in(with: title)
      find(:test_id, 'description_field').fill_in(with: '')
      find(:test_id, 'week_event').click

      expect(find(:test_id, 'event_title')).to have_content(title)
    end
  end

  xcontext 'when filled in with empty values' do
    it 'validates the event fields' do
      find(:test_id, 'title_field').fill_in(with: '')
      find(:test_id, 'description_field').fill_in(with: '')
      find(:test_id, 'week_event').click

      expect(page).to have_content('cannot be empty')
    end
  end
end
