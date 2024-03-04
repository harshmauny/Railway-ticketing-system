class ChangeDepartureToDate < ActiveRecord::Migration[7.0]
    def change
      change_column :trains, :departure_date, :date
      change_column :trains, :arrival_date, :date
    end
  end