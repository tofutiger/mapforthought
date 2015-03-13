class RenameDescriptionDummy < ActiveRecord::Migration
  def change
  	rename_column("users", "desctiption", "description")
  end
end
