# frozen_string_literal: true

class Patient < ApplicationRecord
  has_one :address, as: :addressable

  validates_presence_of :name, :email, :gender, :contact_phone1, allow_blank: false

  accepts_nested_attributes_for :address
end
