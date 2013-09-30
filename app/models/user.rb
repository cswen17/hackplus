class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: {maximum:50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #found it online, basic checking for format
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_secure_password
end
