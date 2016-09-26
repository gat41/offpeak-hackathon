class WelcomeController < ApplicationController
  def index
		@users = User.all
		@listings = Listing.all
		#@total_pages = Listing.all.count
   	
	end

end #end of class

#gem for pagination: https://github.com/mislav/will_paginate
#https://github.com/amatsuda/kaminari
# from scratch
# def index
#    listings_per_page = 7
#    params[:page] = 1 unless params[:page]
#    first_listing = (params[:page].to_i - 1 ) * listings_per_page
#    listings = Listing.all
#    @total_pages = listings.count / listings_per_page
#    if listings.count % listings_per_page > 0
#      @total_pages += 1
#    end
#      @listings = listings[first_listing...(first_listing + listings_per_page)]
#  end

#in index.html.erb
# <!-- <div class="pages">
#   <% (#1..@total_pages).each do |page|  %>
#     <%= link_to page, #controller: "welcome", action: "index", page: page %> &nbsp;
#   <% #end %>
# </div>
#  -->