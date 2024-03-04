class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.string :username
      t.string :name
      t.string :email
      t.string :password
      t.string :phone_num
      t.string :address
      t.string :card_num

      t.timestamps
    end
  end
end
