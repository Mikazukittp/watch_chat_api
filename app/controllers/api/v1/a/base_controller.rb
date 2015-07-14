class Api::V1::A::BaseController < ApplicationController

  def send_push(registration_ids, data)
    n = Rpush::Gcm::Notification.new
    n.app = Rpush::Gcm::App.find_by_name("android_app")  # Rpush::GCM::Appインスタンスを設定
    n.registration_ids = [registration_ids] # registration_idを設定
    n.data = data # カスタムデータ
    n.save!
  end

end