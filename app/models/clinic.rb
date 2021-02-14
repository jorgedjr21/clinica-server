class Clinic < ApplicationRecord
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :patients, inverse_of: :clinic
  before_save :parameterize_subdomain

  validates :name,            presence: true, allow_blank: false
  validates :subdomain,       presence: true, allow_blank: false
  validates :contact_phone_1, presence: true, allow_blank: false

  accepts_nested_attributes_for :addresses

  private

  def parameterize_subdomain
    self.subdomain = subdomain.parameterize if subdomain.present?
  end
end
