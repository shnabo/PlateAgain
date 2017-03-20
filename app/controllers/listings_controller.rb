class ListingsController < ApplicationController

  def index
    @listings = Listing.where('available = ?', true ).where('available_until >= ?', Time.now )
  end

  def show
    find_listing
    load_user
  end

  def new
    if current_user.is_provider
      @listing = Listing.new
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    @listing = Listing.new(listings_params)
    @listing.user_id = current_user.id
    @listing.available = "true"

    if listings_params[:perishable] == "true"
      @listing.perishable = true
    elsif listings_params[:perishable] == "false"
      @listing.perishable = false
    end

    if listings_params[:available] == "true"
      @listing.available = true
    elsif listings_params[:available] == "false"
      @listing.available = false
    end

    if @listing.save
      redirect_to dashboard_path(current_user.id)
    else
      render :new
    end
  end

  def edit
    find_listing
  end

  def update
    find_listing
    if @listing.update_attributes(listings_params)
      current_user.listings << @listing
      # redirect_to dashboard_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    find_listing
    @listing.destroy
    redirect_to dashboard_path(@user)
  end


  private

  def load_user
    @user = User.find(params[:user_id])
  end

  def find_listing
    @listing = Listing.find(params[:id])
  end

  def listings_params
    params.require(:listing).permit(
    :item_name,
    :quantity,
    :perishable,
    :expiry_date,
    :available,
    :available_until,
    :contact_name,
    :contact_phone,
    :contact_email,
    :picture,
    :picture_cache,
    :remote_picture_url,
    :notes,
    :user_id,
    :claimed,
    :claimer_id
    )

  end

  def current_listing
    @current_listing = listing.full_street_address
  end

end
