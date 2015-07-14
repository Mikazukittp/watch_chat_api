class Api::V1::A::ConnectionsController < Api::V1::A::BaseController

  def show
  end

  def create
    @sendUser = User.find(params[:id])
    if @sendUser.relation_id.present?
      render_500({message: 'You have already connected to user(id: #{@sendUser.relation_id})'})
    end
    @receiveUser = User.where(relation_id: nil).sample
    if @receiveuser.blank?
      render_404({message: 'No conectable user.'})
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
