class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.decimal :price
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
