class Listing < ApplicationRecord
  belongs_to :user

  validates_presence_of :item_name, :quantity, :perishable

  # Enable image upload with Carrierwave
  mount_uploader :photo, ImageUploader

  validate :issue_expiry_date, :available_until_issue, :expiry_date_not_larger_than_available

  def issue_expiry_date
    if expiry_date.present? && expiry_date < Date.today
      errors.add(:expiry_date, "must be at least today's date")
    end
  end

  def available_until_issue
    if available_until.present? && available_until < Date.today
      errors.add(:available_until, "must be later then now")
    end
  end

  def expiry_date_not_larger_than_available
    if available_until < expiry_date
      errors.add(:expiry_date, "must be earlier than available date")
    end
  end

end
