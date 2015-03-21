class Location < ActiveRecord::Base

	has_and_belongs_to_many :users

	attr_accessible :address, :latitude, :longitude

	def country_name
    country = ISO3166::Country[address]
    
    
    country.translations[I18n.locale.to_s] || country
  	end

	geocoded_by :country_name
	after_validation :geocode
end
