class AddTokenToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :token, :integer
  end
end
