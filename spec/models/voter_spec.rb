require 'rails_helper'

RSpec.describe Voter, type: :model do
  subject(:voter) { create(:voter) }

  it { is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(26) }
  it { is_expected.to belong_to(:event) }
  it { is_expected.to have_many(:votes) }
end
