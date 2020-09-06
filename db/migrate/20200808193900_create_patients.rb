# frozen_string_literal: true

class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :cpf
      t.string :gender
      t.date :birthdate
      t.string :contact_phone1
      t.string :contact_phone2
      t.boolean :active, default: false
      t.string :comments

      t.references :clinic, index: true
      t.timestamps
    end
  end
end
