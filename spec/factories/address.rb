# This will guess the User class
FactoryBot.define do
  factory :address do
    address_type { '' }
    street     { FFaker::AddressBR.street }
    number     { FFaker::AddressBR.building_number }
    complement { FFaker::AddressBR.secondary_address }
    city       { FFaker::AddressBR.city }
    state      { FFaker::AddressBR.state }
    zipcode    { FFaker::AddressBR.zip_code }

    trait :with_patient do
      association :patient, factory: :patient
    end

    trait :with_clinic do
      association :clinic, factory: :clinic
    end

    trait :with_patient do
      association :patient, factory: :clinic
    end
  end
end
