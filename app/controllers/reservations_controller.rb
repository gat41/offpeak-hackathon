class ReservationsController < ApplicationController
	before_action :require_login

	def index
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def new
		@reservation = Reservation.new
	end

	# def edit
	# 	@listing = Listing.find(params[:id])
	# end

	# def create
	# 	#render plain: params[:listing].inspect
	# 	@listing = Listing.new(listing_params)
	# 	@listing.user_id = current_user.id
	# 	@listing.amenity_ids = params[:listing][:amenity_ids]
	# 	if @listing.save
	# 		redirect_to @listing	
	# 	else
	# 		render 'new'
	# 	end	
	# end

	# def update
	# 	@listing = Listing.find(params[:id])

	# 	if @listing.update(listing_params)
	# 		redirect_to @listing
	# 	else
	# 		render 'edit'
	# 	end
	# end

	# def destroy
	# 	@listing = Listing.find(params[:id])
	# 	@listing.destroy

	# 	redirect_to listings_path
	# end

	# private
	# 	def listing_params
	# 		params.require(:listing).permit(:listing_name, :description, :address, :property_type, :room_type, :num_guests, :num_bedroom, :num_beds, :num_bathroom, :price_per_night)
	# 	end

end
