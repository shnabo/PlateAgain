class User < ApplicationRecord

  authenticates_with_sorcery!
  has_many :listings
  has_many :comments

  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates_presence_of :is_provider

  validates_presence_of :username, :email, :name, :password
  validates_uniqueness_of :username
  validates :username, format: { without: /\s/ }
  # validates registration
  # we just have ^ here for future reminder

  # Enable image upload with Carrierwave
  mount_uploader :photo, ImageUploader

  #all of email methods needed
  #in order to add mailbox methods, send methods etc
  acts_as_messageable

  def mailboxer_email(object)
    nil
  end

  # Allows pretty urls
  def to_param
    username
  end

  def self.find(input)
    # if input.to_i != 0
    #   super
    # else
      find_by_username(input)
    # end
  end

end
