require 'rails_helper'

RSpec.describe Voter, type: :model do
  subject(:voter) { create(:voter) }

  context 'validations' do
    it { is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(26) }
  end
  context 'associations' do
    it { is_expected.to belong_to(:event) }
    it { is_expected.to have_many(:votes) }
  end
  context 'attributes' do
    it { is_expected.to accept_nested_attributes_for(:votes) }
  end
end
