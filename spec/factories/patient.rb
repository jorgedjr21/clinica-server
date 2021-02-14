# This will guess the User class
FactoryBot.define do
  factory :patient do
    name           { FFaker::Name.name }
    email          { FFaker::Internet.email }
    cpf            { FFaker::IdentificationBR.pretty_cpf }
    gender         { FFaker::GenderBR.random }
    date           { Time.zone.today - 10.years }
    contact_phone1 { FFaker::PhoneNumberBR.phone_number }
    contact_phone2 { FFaker::PhoneNumberBR.phone_number }
    active         { true }
    comments       { FFaker::Lorem.paragraph }
  end
end
