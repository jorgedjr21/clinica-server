require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'address definition' do

    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:zipcode) }
    it { is_expected.to belong_to(:addressable) }
  end

  describe '#include' do
    context 'with a built set' do
      subject(:address_subject) { build(:address) }

      it 'must include ClinicScoped' do
        expect(described_class).to include(ClinicScoped)
      end
    end
  end
end
