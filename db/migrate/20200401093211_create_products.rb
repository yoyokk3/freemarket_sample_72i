class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string      :name,        null: false
      t.integer     :price,       null: false
      t.integer     :status,      null: false
      t.text        :description, null: false
      t.integer     :sending,     null: false
      t.integer     :send_cost,   null: false
      t.references  :users,     null: false, foreign_key: true
      t.references  :categories,	null: false, foreign_key: true
      t.references  :brands,    null: false, foreign_key: true
      t.timestamps

    # add_column :products, :send_cost, :integer, null: false
    # add_column :products, :user_id, :bigint
    # add_column :products, :category_id, :bigint
    # add_column :products, :brand_id, :bigint
    # add_foreign_key "products", "users", column: :"user_id"
    # add_foreign_key "products", "categories", column: :"category_id"
    # add_foreign_key "products", "brands", column: :"brand_id"
    end
  end
end
