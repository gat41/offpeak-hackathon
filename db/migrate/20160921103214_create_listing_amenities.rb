class CreateListingAmenities < ActiveRecord::Migration
  def change
    create_table :listing_amenities do |t|
 			t.belongs_to :listing, index: true
      t.belongs_to :amenity, index: true
      t.timestamps null: false
    end
  end
end
