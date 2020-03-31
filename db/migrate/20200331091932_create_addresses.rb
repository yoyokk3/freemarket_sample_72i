class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_reading, null: false
      t.string :last_name_reading, null: false
      t.integer :postal_code, null: false
      t.string :to_do_fu_ken, null: false
      t.string :si_ku_cho_son, null: false
      t.string :banti, null: false
      t.string :apartment_name
      t.integer :call_number, null: false, unique: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
