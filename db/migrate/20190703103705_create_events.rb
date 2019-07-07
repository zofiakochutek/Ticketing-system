class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :name
      t.datetime :date
      t.decimal :time

      t.timestamps
    end
  end
end
