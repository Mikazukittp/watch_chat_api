class Api::V1::MessagesController < Api::V1::BaseController

  def index
    #究極に書き直したいが暫定的に
    sender = User.find(params[:sender_id])
    @messages = Message.where('sender_id = ? or sender_id = ?', sender.id, sender.relation_id)
    .where('opponent_id = ? or opponent_id = ?', sender.id, sender.relation_id)

    render :json => @messages
  end

  def show
  end

  def create

    @message = Message.new(message_params)
    @message.opponent_id = User.find(params[:sender_id]).relation_id

    @message.save

    opponent = User.find(@message.opponent_id)

    case opponent.device_type
    when "android"
      data = { message: params[:content], push_type: "message" }
      send_push_a(opponent.gcm_id, data)
    when "ios"
      send_push_i(opponent.gcm_id, params[:content], "message")
    end

    render :json => @message, status: :ok
  end

  private

  def message_params
    params.permit(:sender_id, :content)
  end

end

