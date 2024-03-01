class CreateForumPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :forum_posts do |t|
      t.string :text
      t.references :forum_thread, null: false, foreign_key: true

      t.timestamps
    end
  end
end
