# frozen_string_literal: true

class Patient < ApplicationRecord
  has_one :address, as: :addressable, dependent: :destroy

  validates :name,           presence: true, allow_blank: false
  validates :email,          presence: true, allow_blank: false
  validates :gender,         presence: true, allow_blank: false
  validates :contact_phone1, presence: true, allow_blank: false

  accepts_nested_attributes_for :address
end
