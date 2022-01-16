class User < ActiveRecord::Base

  def authenticate_with_credentials(email, password)
    if user = User.find_by_email(email.strip.downcase)
      if user.authenticate(password)
        return true
      end
    end
  end

  has_secure_password
  validates :password, confirmation: { case_sensitive: false }
  validates :email, uniqueness: true
  validates :password, length: { in: 6..20 }
  validates :email, :password_confirmation, :name, presence: true

end