class Clinic < ApplicationRecord
  has_many :addresses, as: :addressable, dependent: :destroy, inverse_of: :clinics

  validates :name,            presence: true, allow_blank: false
  validates :subdomain,       presence: true, allow_blank: false
  validates :contact_phone_1, presence: true, allow_blank: false

  accepts_nested_attributes_for :addresses
end
