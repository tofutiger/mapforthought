class CreateTripImages < ActiveRecord::Migration
  def change
    create_table :trip_images do |t|
      t.string :caption
      t.integer :trip_id

      t.timestamps
    end
  end
end
