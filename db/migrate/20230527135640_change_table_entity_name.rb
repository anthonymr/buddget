class ChangeTableEntityName < ActiveRecord::Migration[7.0]
  def change
    rename_table :entities, :payments
  end
end
