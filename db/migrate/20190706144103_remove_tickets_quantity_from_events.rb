class RemoveTicketsQuantityFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :tickets_quantity, :integer
  end
end
