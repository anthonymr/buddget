class RemoveForeingKeyFromPaymentsAndGroups < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :payments, :groups
  end
end
