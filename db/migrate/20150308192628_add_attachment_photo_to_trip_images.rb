class AddAttachmentPhotoToTripImages < ActiveRecord::Migration
  def self.up
    change_table :trip_images do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :trip_images, :photo
  end
end
