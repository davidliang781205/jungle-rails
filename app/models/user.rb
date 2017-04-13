class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email
  validates_confirmation_of :password
  # attr_accessible :password, :password_confirmation
  # attr_accessor :password

end
