require 'rails_helper'

RSpec.describe Vote, type: :model do
  subject(:vote) { create(:vote) }

  it { is_expected.to validate_presence_of(:day) }
  it { is_expected.to allow_value(Date.today).for(:day) }
  it { is_expected.to belong_to(:event) }
  it { is_expected.to belong_to(:voter) }
end
