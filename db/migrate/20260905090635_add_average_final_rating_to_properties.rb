class AddAverageFinalRatingToProperties < ActiveRecord::Migration[8.1]
  def change
    add_column :properties, :average_final_rating, :decimal, default: 0.0, null: false
  end
end
