class AddPictureToPhoto < ActiveRecord::Migration
  def change
    add_column :photo, :picture, :caption, :string
    add_column :place_id, :integer
  end
end
