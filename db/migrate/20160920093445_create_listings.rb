class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.belongs_to :user, index: true
	    t.text :listing_name
	    t.text :description
			t.string :address
			t.string :property_type #apartment
			t.string :room_type
			t.integer :num_guests
			t.integer :num_bedroom
			t.integer :num_beds
			t.integer :num_bathroom
			t.integer :price_per_night
	    t.timestamps null: false
    end
  end
end