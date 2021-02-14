# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :address_type, default: 0
      t.string :street, null: false
      t.string :number
      t.string :complement
      t.string :city
      t.string :state
      t.string :zipcode, null: false

      t.bigint  :addressable_id
      t.string  :addressable_type
      t.timestamps
    end

    add_index :addresses, %i[addressable_type addressable_id]
  end
end
