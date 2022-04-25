require 'rails_helper'

RSpec.feature 'EventShow', type: :feature do
  subject(:event) { create(:event) }
  before do
    visit "/events/#{event.id}/show"
  end
end
