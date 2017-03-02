class Listing < ApplicationRecord
  belongs_to :user

  validates_presence_of :item_name, :quantity, :perishable

  # Enable image upload with Carrierwave
  mount_uploader :photo, ImageUploader

  def does_not_start_in_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "must be today's date")
    end
  end

  def does_not_start_in_future
    if start_date.present? && start_date > Date.today
      errors.add(:start_date, "must be today's date")
    end
  end

  def expiration_date_is_not_in_past
    if end_date.present? && end_date > Date.today
      errors.add(:end_date, "must be in the future")
    end
  end

end
