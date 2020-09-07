require 'rails_helper'

RSpec.describe Clinic, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:subdomain) }
  it { is_expected.to validate_presence_of(:contact_phone_1) }
  it { is_expected.to accept_nested_attributes_for(:addresses) }

  context 'saving a clinic' do
    it 'must parameterize the subdomain attribute' do
      clinic = build(:clinic, subdomain: 'teste de subdomain')
      expect { clinic.save }.to change(clinic, :subdomain).to('teste-de-subdomain')
    end
  end
end
