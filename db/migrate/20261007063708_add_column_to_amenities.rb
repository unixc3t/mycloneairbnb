class AddColumnToAmenities < ActiveRecord::Migration[8.1]
  def change
    add_column :amenities, :icon, :string
  end
end
