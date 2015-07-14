class Api::V1::I::BaseController < ApplicationController

  def send_push(device_token, alert)
    n = Rpush::Apns::Notification.new
    n.app = Rpush::Apns::App.find_by_name("ios_app") # Rpush::Apns::Appインスタンスを設定
    n.device_token = device_token # デバイストークン
    n.alert = alert  # プッシュメッセージ
    n.data = { category: :remotePush } # カスタムデータ
    n.save!
  end

end