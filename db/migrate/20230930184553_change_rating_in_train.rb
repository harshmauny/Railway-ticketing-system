class ChangeRatingInTrain < ActiveRecord::Migration[7.0]
  def change
    change_column :trains, :rating, :float
  end
end
