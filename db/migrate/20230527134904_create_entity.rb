class CreateEntity < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.references :author, foreign_key: { to_table: 'users' }, null: false
      t.string :name, null: false, limit: 50
      t.decimal :amount, null: false, precision: 10, scale: 2

      t.timestamps
    end
  end
end
