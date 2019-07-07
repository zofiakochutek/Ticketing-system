class AddAvailableTicketsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :available_tickets, :integer
  end
end
