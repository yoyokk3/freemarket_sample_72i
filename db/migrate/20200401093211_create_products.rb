class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    t.string      :name,        null: false
    t.integer     :price,       null: false
    t.integer     :status,      null: false
    t.text        :description, null: false
    t.integer     :sending,     null: false
    t.integer     :send_cost,   null: false
    t.bigint      :users_id,    null: false, foreign_key: true
    t.bigint      :categories_id,    null: false, foreign_key: true
    t.bigint      :brands_id,    null: false, foreign_key: true
    t.bigint      :shippings_id,    null: false, foreign_key: true
    t.timestamps
    end
  end
end
