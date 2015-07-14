class User < ActiveRecord::Base
  has_many :messages, foreign_key: "sender_id"
end
