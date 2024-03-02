class AddUserResources < ActiveRecord::Migration[7.1]
  def change
    add_column :resources, :user.id, :integer
  end
end
