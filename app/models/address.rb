# frozen_string_literal: true

class Address < ApplicationRecord
  include ClinicScoped
  belongs_to :addressable, polymorphic: true

  validates :street,  presence: true, allow_blank: false
  validates :number,  presence: true, allow_blank: false
  validates :city,    presence: true, allow_blank: false
  validates :state,   presence: true, allow_blank: false
  validates :zipcode, presence: true, allow_blank: false
end
