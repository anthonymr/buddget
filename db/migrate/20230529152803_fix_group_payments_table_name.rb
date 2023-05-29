class FixGroupPaymentsTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :group_payments_tables, :group_payments
  end
end
