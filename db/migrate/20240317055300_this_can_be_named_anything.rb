class ThisCanBeNamedAnything < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :name, :string
    change_column :users, :email, :string, null: false
  end
  def down
    remove_column :users, :name, :string
    change_column :users, :email, :string, null: true
  end
end
