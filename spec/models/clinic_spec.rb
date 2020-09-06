require 'rails_helper'

RSpec.describe Clinic, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:subdomain) }
  it { is_expected.to validate_presence_of(:contact_phone_1) }
  it { is_expected.to accept_nested_attributes_for(:addresses) }
end
