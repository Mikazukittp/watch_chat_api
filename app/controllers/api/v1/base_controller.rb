class Api::V1::BaseController < ApplicationController

  def send_push_a(registration_ids, data)
    n = Rpush::Gcm::Notification.new
    n.app = Rpush::Gcm::App.find_by_name("android_app")  # Rpush::GCM::Appインスタンスを設定
    n.registration_ids = [registration_ids] # registration_idを設定
    n.data = data # カスタムデータ
    n.save!
  end

  def send_push_i(device_token, alert, push_type)
    n = Rpush::Apns::Notification.new
    n.app = Rpush::Apns::App.find_by_name("ios_app") # Rpush::Apns::Appインスタンスを設定
    n.device_token = device_token # デバイストークン
    n.alert = alert  # プッシュメッセージ
    n.data = { category: :remotePush, push_type: push_type } # カスタムデータ
    n.save!
  end

end