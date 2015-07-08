class CreateNewLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :bookmark_id
      t.integer :user_id
      t.timestamps null: false
    end
    add_index :bookmarks, :id, unique: true
    add_index :users, :id, unique: true
    add_index :likes, :id, unique: true
    add_index :likes, :bookmark_id
    add_index :likes, :user_id
  end
end
