class UpdateUserEmailToUnique < ActiveRecord::Migration[6.0]
  def up
    add_index :users, :email, unique: true 
  end
  def down
    remove_index :users, :email, unique: true 
  end
end
