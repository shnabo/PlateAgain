class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :listings

  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true, presence: true
  validates :phone, uniqueness: true, length: { minimum: 10}
  validates_presence_of :name, :address, :description
  # validates registration
  # we just have ^ here for future reminder

  # Enable image upload with Carrierwave
  mount_uploader :photo, ImageUploader
end
