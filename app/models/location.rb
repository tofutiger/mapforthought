class Location < ActiveRecord::Base

	has_and_belongs_to_many :users

	attr_accessible :address, :latitude, :longitude
	geocoded_by :address
	after_validation :geocode
end
