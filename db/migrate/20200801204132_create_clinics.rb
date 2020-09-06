class CreateClinics < ActiveRecord::Migration[6.0]
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :subdomain
      t.string :contact_phone_1
      t.string :contact_phone_2

      t.timestamps
    end
  end
end
