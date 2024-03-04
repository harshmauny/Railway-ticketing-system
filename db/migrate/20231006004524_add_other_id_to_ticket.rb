class AddOtherIdToTicket < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :other_id, :integer
  end
end
