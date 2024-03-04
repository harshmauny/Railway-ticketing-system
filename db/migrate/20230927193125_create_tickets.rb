class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.integer :confirm_num

      t.timestamps
    end
  end
end
