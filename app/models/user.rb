class User < ActiveRecord::Base
	before_save { self.email = email.downcase }

	validates :name, :presence => true, :length => { minimum: 2, maximum: 55 }
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, :presence => true, :length => { minimum: 7, maximum: 255 },
						:format => { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

	private
		def User.digest(string)
			cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
																										BCrypt::Engine.cost
			BCrypt::Password.create(string, cost: cost)
		end
end
