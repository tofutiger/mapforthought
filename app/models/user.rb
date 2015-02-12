class User < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 25 }
	validates :email, presence: true, length: { maximum: 50 }
	attr_accessible :name, :email
end