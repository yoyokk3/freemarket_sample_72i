class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer    :card_number,     null: false
      t.string     :brand,           null: false
      t.integer    :deadline_year,   null: false
      t.integer    :deadline_manth,  null: false
      t.string     :name_onCard,     null: false
      t.integer    :security_code,   null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
