class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :send_cost, :integer, null: false
    add_column :products, :user_id, :bigint
    add_column :products, :category_id, :bigint
    add_column :products, :brand_id, :bigint
    add_foreign_key "products", "users", column: :"user_id"
    add_foreign_key "products", "categories", column: :"category_id"
    add_foreign_key "products", "brands", column: :"brand_id"
  end
end
