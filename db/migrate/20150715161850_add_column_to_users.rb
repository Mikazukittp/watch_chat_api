class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :device_type, :string
  end
end
