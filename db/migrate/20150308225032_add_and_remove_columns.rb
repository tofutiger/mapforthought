class AddAndRemoveColumns < ActiveRecord::Migration
  def change
  	add_column("users", "token", :string)
  	remove_column("users", "user_id")
  	remove_column("trip_images", "trip_id")
  	
  end
end
