class AddCostToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :cost, :float
  end
end
