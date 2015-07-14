class RenamePushIdToUsers < ActiveRecord::Migration
  def up
  	rename_column :Users, :push_id, :gcm_id
  end

  def down
  	rename_column :Users, :gcm_id, :push_id
  end
end
