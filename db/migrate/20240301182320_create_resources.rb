class CreateResources < ActiveRecord::Migration[7.1]
  def change
    create_table :resources do |t|
      t.string :title
      t.string :description
      t.string :subject
      t.integer :student_age
      t.integer :grade
      t.string :category
      t.string :resource_type

      t.timestamps
    end
  end
end
