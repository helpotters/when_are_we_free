require 'rails_helper'

RSpec.feature 'EventShow', type: :feature do
  subject(:event) { create(:event) }
  let(:title) { event.title }
  let(:description) { event.description }
  before do
    visit "events/#{event.id}"
  end

  context 'View Basic Information' do
    it 'should have event title' do
      expect(find(:test_id, 'event_title')).to have_content(title)
      expect(find(:test_id, 'event_description')).to have_content(description.to_s)
    end
  end
end
