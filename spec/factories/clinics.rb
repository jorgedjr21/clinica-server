FactoryBot.define do
  factory :clinic do
    name { FFaker::Company.name }
    subdomain { FFaker::Internet.domain_word }
    contact_phone_1 { FFaker::PhoneNumberBR.phone_number }
    contact_phone_2 { FFaker::PhoneNumberBR.phone_number }
  end
end
