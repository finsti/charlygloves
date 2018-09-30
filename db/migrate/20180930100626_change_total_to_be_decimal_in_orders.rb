class ChangePhoneToBeDecimalInCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :total, :decimal
  end
end
