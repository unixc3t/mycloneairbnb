class AddIndexToPropertyAmenities < ActiveRecord::Migration[8.1]
  def change
      add_index :property_amenities, [ :amenity_id, :property_id ], unique: true
  end
end
