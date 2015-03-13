class CreateLocationsUsersJOin < ActiveRecord::Migration
  def change
    create_table :locations_users, :id => false do |t|
    	t.integer "location_id"
    	t.integer "user_id"
    end
    add_index :locations_users, ["location_id", "user_id"]
  end
end
