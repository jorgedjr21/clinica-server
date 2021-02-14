# This will guess the User class
FactoryBot.define do
  factory :address do
    address_type { 0 }
    street     { FFaker::AddressBR.street }
    number     { FFaker::AddressBR.building_number }
    complement { FFaker::AddressBR.secondary_address }
    city       { FFaker::AddressBR.city }
    state      { FFaker::AddressBR.state }
    zipcode    { FFaker::AddressBR.zip_code }

    association :addressable
  end
end
