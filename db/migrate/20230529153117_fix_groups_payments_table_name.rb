class FixGroupsPaymentsTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :group_payments, :groups_payments
  end
end
