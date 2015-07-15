class Api::V1::ConnectionsController < Api::V1::BaseController

  def show
  end

  def create
    @sendUser = User.find(params[:id])
    if @sendUser.relation_id.present?
      return render json: {message: "You have already connected to user(id: #{@sendUser.relation_id})"}, status: 500
    end

    @receiveUser = User.where.not(id: params[:id]).where(relation_id: nil).sample
    if @receiveUser.blank?
      return render json: {message: "No conectable user."}, status: 404
    end

    ##@sendUserのrelation_idに、receiveUserのidを代入。@receiveUserのrelation_idにsendUserのidを代入
    User.transaction do
      @sendUser.update!(relation_id: @receiveUser.id)
      @receiveUser.update!(relation_id: @sendUser.id)
    end

    case @receiveUser.device_type
    when "android"
      data = { message: "#{@sendUser.name}さんとつながりました！", push_type: "connect" }
      send_push_a(@receiveUser.gcm_id, data)
    when "ios"
      send_push_i(@receiveUser.gcm_id, "#{@sendUser.name}さんとつながりました！", "connect")
    end

    render json: @receiveUser, status: :created

  rescue => e
    render_500(e)
  end

  def destroy

    @user = User.find(params[:id])
    @opponent = User.find(@user.relation_id)

    User.transaction do
      @user.update!(relation_id: nil)
      @opponent.update!(relation_id: nil)
    end

    case @opponent.device_type
    when "android"
      data = { message: "#{@opponent.name}さんとの接続が切れました", push_type: "delete" }
      send_push_a(@opponent.gcm_id, data)
    when "ios"
      send_push_i(@opponent.gcm_id, "#{@opponent.name}さんとの接続が切れました", "delete")
    end

    render json: @opponent, status: :ok

    rescue => e
    render_500(e)
  end
end
