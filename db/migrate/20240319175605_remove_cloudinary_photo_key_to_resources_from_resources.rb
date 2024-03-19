class RemoveCloudinaryPhotoKeyToResourcesFromResources < ActiveRecord::Migration[7.1]
  def change
    remove_column :resources, :cloudinary_photo_key, :string
  end
end
