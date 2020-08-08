# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates_presence_of :street, :number, :city, :state, :zipcode, allow_blank: false
end
