class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
