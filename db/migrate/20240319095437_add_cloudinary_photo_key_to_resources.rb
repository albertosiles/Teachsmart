class AddCloudinaryPhotoKeyToResources < ActiveRecord::Migration[7.1]
  def change
    add_column :resources, :cloudinary_photo_key, :string
  end
end
