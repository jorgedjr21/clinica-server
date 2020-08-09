# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :street,  allow_blank: false
  validates :number,  allow_blank: false
  validates :city,    allow_blank: false
  validates :state,   allow_blank: false
  validates :zipcode, allow_blank: false
end
