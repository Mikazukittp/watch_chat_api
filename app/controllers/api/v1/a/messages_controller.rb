class Api::V1::A::MessagesController < Api::V1::A::BaseController

  def index
    @messages = Message.where(sender_id: params[:sender_id])
    render :json => @messages
  end

  def show
  end

  def create

    @message = Message.new(message_params)
    @message.opponent_id = User.find(params[:sender_id]).relation_id

    @message.save

    data = { message: params[:content] }
    send_push(User.find(@message.opponent_id).gcm_id, data)

    render :json => @message, status: :ok
  end

  private

  def message_params
    params.require(:message).permit(:sender_id, :content)
  end

end

