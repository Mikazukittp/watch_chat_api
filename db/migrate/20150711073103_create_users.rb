##user_tableのテーブル定義
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string	:user_name,	null:false
    	t.string	:hash_key, null:false
    	t.string	:push_id, null:false
    	t.integer	:relation_id
      t.timestamps
    end
  end
end
