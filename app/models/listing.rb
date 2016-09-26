class Listing < ActiveRecord::Base

 PROPERTIES = ["Guesthouse", "House", "Apartment"]
 ROOMS = ["Private Room", "Shared Room", "Entire Apartment/House"]

  belongs_to :user
	has_many :listing_amenities, dependent: :destroy
	has_many :amenities, :through => :listing_amenities
  has_many :reservations, dependent: :destroy

  #has_many :photos
  #has_many :reservations
  #geocoded_by :address
  # If address is updated, geocode will generate a new set of latitude and longitude
  #after_validation :geocode, if: :address_changed?

  validates :property_type, :room_type, :num_guests, :num_bedroom, :num_beds, :num_bathroom, :listing_name, :description, :address, :price_per_night, presence: true
  validates :listing_name, length: {maximum: 50}
	validates :description, length: {maximum: 500}

  #http://www.rymcmahon.com/articles/2
  #ILIKE: for non-sensitive case search
  def self.search(search)
    where("address ILIKE ?", "%#{search}%") 
  end

end

