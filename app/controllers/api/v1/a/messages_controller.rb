class Api::V1::A::MessagesController < ApplicationController

  def index
  end

  def show
  end

  def create
    data = { message: "hi mom!" }
    send_push(params[:registration_ids], data)
  end

  private

  def send_push(registration_ids, data)
    n = Rpush::Gcm::Notification.new
    n.app = Rpush::Gcm::App.find_by_name("android_app")  # Rpush::GCM::Appインスタンスを設定
    n.registration_ids = ["token", "..."] # registration_idを設定
    n.data = { message: "hi mom!" } # カスタムデータ
    n.save!
  end

end

