# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :number
      t.string :complement
      t.string :city
      t.string :state
      t.string :zipcode, null: false

      t.references :addressable, polymorphic: true, index: true
      t.references :clinic, index: true
      t.timestamps
    end
  end
end
