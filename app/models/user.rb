class User < ActiveRecord::Base
  has_many :messages, foreign_key: "sender_id"
  has_many :reports
end
