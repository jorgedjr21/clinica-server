require 'rails_helper'

RSpec.describe Patient, type: :model do

  describe 'patient definition' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:gender) }
    it { is_expected.to validate_presence_of(:contact_phone1) }
    it { is_expected.to have_one(:address) }
    it { is_expected.to accept_nested_attributes_for(:address) }
    it { is_expected.to belong_to(:clinic)}
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
