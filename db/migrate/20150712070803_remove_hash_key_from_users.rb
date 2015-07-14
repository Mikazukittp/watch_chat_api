class RemoveHashKeyFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :hash_key, :string
  end

  def down
  	add_colum :users, :hash_key, :string
  end
end
