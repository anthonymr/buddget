class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.references :author, foreign_key: { to_table: 'users' }, null: false
      t.string :name, null: false, index: { unique: true }, limit: 50
      t.string :icon, null: false

      t.timestamps
    end
  end
end
