class AddUsersToLikes < ActiveRecord::Migration
  def change
     drop_table :likes
  end
end
