class RemoveGrade < ActiveRecord::Migration[7.1]
  def change
    remove_column :resources, :grade
  end
end
