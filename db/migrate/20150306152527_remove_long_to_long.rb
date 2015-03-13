class RemoveLongToLong < ActiveRecord::Migration
  def change
  	rename_column("users", "longitutde", "longitude")
  end
end
