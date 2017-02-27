class ListingController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(params[:id])
      if @listing.save
        redirect_back_or_to root_path
      else
        render :new
      end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
      if @listing.update(listing_params)
        redirect_to(@listing)
      end
  end

  def destroy
    @listing.all = Listing.find(params[:id])
    @listing.destroy
  end


  private

  def listing_params
    params.require(:listing).permit(:item_name, :quantity, :perishable, :donor_id, :expiry_date, :available_until, :contact_name, :contact_phone, :contact_email, :picture, :notes)
  end

end
