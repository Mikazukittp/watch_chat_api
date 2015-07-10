class Api::V1::I::DeviceTokensController < ApplicationController
  # @param [String] device_token
  def update

    # 現状これらのコードはエラーになるのでコメントアウト、別PRで対応します。
    #current_user.device_token = params[:device_token]

    #ActiveRecord::Base.transaction do
    #  current_user.save!
    #  current_user.sweep_same_device_tokens
    #end
    @hogehoge = { :result => "疎通はOK"}

    render :json => @hogehoge, status: :ok
  end
end