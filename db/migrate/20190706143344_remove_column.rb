class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :tickets_quantity
    remove_column :tickets, :price
  end
end
