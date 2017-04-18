class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name
  validates :password, confirmation: true, length: { minimum: 3 }

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    end
  end
end
