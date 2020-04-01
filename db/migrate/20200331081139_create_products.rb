class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string     :name,         null: false
      t.integer    :price,        null: false
      t.integer    :status,       null: false, default: 0
      t.text       :description,  null: false
      t.integer    :sending,      null: false
      t.integer    :sendCost,     null: false
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
