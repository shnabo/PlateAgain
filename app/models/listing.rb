class Listing < ApplicationRecord
  belongs_to :user

  validate :expiry_date
  validate :available_until
  validates_presence_of :item_name, :quantity
  validates_inclusion_of :perishable, in: [true, false]
  validate :issue_expiry_date, :available_until_issue

  # Enable image upload with Carrierwave
  mount_uploader :picture, ImageUploader

  def issue_expiry_date
    if expiry_date.present? && expiry_date < Date.today
      errors.add(:expiry_date, "Must be at least today's date")
    end
  end

  def available_until_issue
    if available_until.present? && available_until < DateTime.current
      errors.add(:available_until, "Must be later than today")

    end
  end

  def available_until_readable
    self.available_until.strftime("%B %-d, %Y at %l:%M %p")
  end

  def listing_address
    @listing_address = listing.full_street_address
  end



end
