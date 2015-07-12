class Api::V1::A::MessagesController < ApplicationController

  def index
  end

  def show
  end

  def create

    data = { message: "やっほー松田翔太だよー" }
    send_push(params.require(:registration_ids), data)

    @hogehoge = { :result => "プッシュ通知飛んだかな？"}
    render :json => @hogehoge, status: :ok

  end

  private

  def send_push(registration_ids, data)
    n = Rpush::Gcm::Notification.new
    n.app = Rpush::Gcm::App.find_by_name("android_app")  # Rpush::GCM::Appインスタンスを設定
    n.registration_ids = [registration_ids] # registration_idを設定
    n.data = { message: "やっほー松田翔太だよー" } # カスタムデータ
    n.save!
  end

  def user_params
      params.permit(:registration_ids)
  end

end

