class Api::V1::I::MessagesController < Api::V1::I::BaseController

  def index
  end

  def show
  end

  def create

    @message = Message.new(message_params)
    @message.opponent_id = User.find(params[:sender_id]).relation_id

    @message.save

    send_push(User.find(@message.opponent_id).gcm_id, params[:content])

    render :json => @message, status: :ok
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :content)
  end

end