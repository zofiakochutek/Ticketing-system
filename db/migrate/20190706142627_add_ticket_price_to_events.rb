class AddTicketPriceToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :ticket_price, :decimal
  end
end
