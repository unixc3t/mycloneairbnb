class AddReviewsCountToProperties < ActiveRecord::Migration[8.1]
  def change
    add_column :properties, :reviews_count, :integer, default: 0, null: false
  end
end
