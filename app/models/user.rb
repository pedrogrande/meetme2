class User < ActiveRecord::Base
	validates :name, :email, :password, presence: true
	validates :password, length: { minimum: 8 }
end