class AddTestToUsers < ActiveRecord::Migration
  def change
  	add_column("users", "username", :string, :limit => 25)
  	add_column("users", "desctiption", :text)
  end
end
