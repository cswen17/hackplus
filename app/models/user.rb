class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  before_save { self.email = email.downcase }
  before_save :create_remember_token
  has_many :tasks
  validates :name, presence: true, length: {maximum:50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #found it online, basic checking for format
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true

  has_secure_password

  private

  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end
end
