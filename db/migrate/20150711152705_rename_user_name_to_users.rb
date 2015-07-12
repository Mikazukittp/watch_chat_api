##Usersテーブルの変数名を変更
class RenameUserNameToUsers < ActiveRecord::Migration
  def up
  	rename_column :Users, :user_name, :name
  end

  def down
  	rename_column :Users, :name, :user_name
  end
end
