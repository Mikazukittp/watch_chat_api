class Api::V1::A::ConnectionsController < Api::V1::A::BaseController

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
    render json: @opponent, status: :ok

    rescue => e
    render_500(e)
  end
end
