class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.text :content
      t.string :media, null: true
      t.integer :parent_id, null: true

      t.timestamps
    end
  end
end
