class Amenity < ActiveRecord::Base

	has_many :listing_amenities
	has_many :listings, :through => :listing_amenities


end

#http://guides.rubyonrails.org/association_basics.html
#l.amenity_ids = [1,2]
