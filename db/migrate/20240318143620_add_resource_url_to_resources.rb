class AddResourceUrlToResources < ActiveRecord::Migration[7.1]
  def change
    add_column :resources, :resource_url, :string
  end
end
