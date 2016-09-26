class Reservation < ActiveRecord::Base

	belongs_to :listing
	belongs_to :user

 	validates :start_date, :end_date, :num_guests, :total_price, presence: true

end
