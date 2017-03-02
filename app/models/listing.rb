class Listing < ApplicationRecord
  belongs_to :user

  validate :expiry_date
  validate :available_until
  validates_presence_of :item_name, :quantity, :perishable

  def expiry_date_not_past
    if start_date.present? && start_date < Date.today
      errors.add(:expiry_date, "must be today's date")
    end
  end

  def available_until_not_past
    if expiry_date.present? && start_date < Date.today
      errors.add(:expiry_date, "must be today's date")
    end
  end

  def expiration_date_is_not_in_past
    if available_until.present? && end_date < Date.today
      errors.add(:available_until, "must be in the future")
    end
  end
end
