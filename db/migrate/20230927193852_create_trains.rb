class CreateTrains < ActiveRecord::Migration[7.0]
  def change
    create_table :trains do |t|
      t.integer :train_num
      t.string :departure_st
      t.string :terminal_st
      t.datetime :departure_date
      t.time :departure_time
      t.datetime :arrival_date
      t.time :arrival_time
      t.float :ticket_price
      t.integer :train_capacity
      t.integer :seats_left

      t.timestamps
    end
  end
end
