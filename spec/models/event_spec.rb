require 'rails_helper'

RSpec.describe Event, type: :model do
  subject(:event) { create(:event) }

  context 'validations' do
    it { is_expected.to validate_length_of(:title).is_at_least(2).is_at_most(100) }
    it { is_expected.to validate_length_of(:description).is_at_least(0).is_at_most(200) }

    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }

    it { is_expected.to validate_presence_of(:minimum) }
  end
  context 'value tests' do
    it { is_expected.to allow_value(Date.today).for(:start_date) }
    it { is_expected.to allow_value(Date.today + 1).for(:end_date) }
    it { is_expected.to allow_value(Date.today.strftime('%F').to_s).for(:end_date) }
  end
  context 'associations' do
    it { is_expected.to have_many(:voters) }
  end
end
