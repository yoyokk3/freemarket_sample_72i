class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    t.string      :name,        null: false
    t.integer     :price,       null: false
    t.integer     :status,      null: false
    t.text        :description, null: false
    t.integer     :sending,     null: false
    t.integer     :send_cost
    t.integer     :exhibition_status, null: false
    t.bigint      :user_id,    foreign_key: true
    t.bigint      :categories_id,    foreign_key: true
    t.bigint      :brands_id,    foreign_key: true
    t.bigint      :shippings_id,  foreign_key: true
    t.timestamps
    end
  end
end
