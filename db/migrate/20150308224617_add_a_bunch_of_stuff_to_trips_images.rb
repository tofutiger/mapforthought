class AddABunchOfStuffToTripsImages < ActiveRecord::Migration
  def change
  	add_column("trip_images", "user_id", :integer)
  	add_column("trip_images", "user_token", :string)
  end
end
