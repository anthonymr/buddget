class AddGroupRefToPayments < ActiveRecord::Migration[7.0]
  def change
    add_reference :payments, :group, foreign_key: true, null: false
  end
end
