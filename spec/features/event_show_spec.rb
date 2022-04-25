require 'rails_helper'

RSpec.feature 'EventShow', type: :feature do
  let(:event) { create(:event) }

  before do
    visit "events/#{event.id}"
  end
  def self.view_content(attribute)
    it "check for #{attribute} in event view" do
      value = event[attribute]
      expect(find(:test_id, "event_#{attribute}")).to have_content(value)
    end
  end

  context 'View Basic Information' do
    %w[title description start_date end_date].each { |attribute| view_content(attribute) }
  end
end
