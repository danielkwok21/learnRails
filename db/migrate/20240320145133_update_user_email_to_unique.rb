class UpdateUserEmailToUnique < ActiveRecord::Migration[6.0]
  def up
    add_index :users, :email, unique: true 
  end
  def down
    remopve_index :users, :email, unique: true 
  end
end
