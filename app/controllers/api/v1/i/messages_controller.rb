class Api::V1::I::MessagesController < ApplicationController

  def index
  end

  def show
  end

  def create
    data = { foo: :bar }
    send_push(params[:devise_token], "我輩がPUSH通知を送ってやったわ！", data)
  end

  private

  def send_push(device_token, alert, data)

    n = Rpush::Apns::Notification.new
    n.app = Rpush::Apns::App.find_by_name("ios_app") # Rpush::Apns::Appインスタンスを設定
    n.device_token = device_token # デバイストークン
    n.alert = alert  # プッシュメッセージ
    n.data = data # カスタムデータ
    n.save!

  end

end