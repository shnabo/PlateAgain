class ListingsController < ApplicationController


  def new
    @listing = Listing.new
  end
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def mylistings
    @listings = Listing.find(params[:user_id])
  end
end
