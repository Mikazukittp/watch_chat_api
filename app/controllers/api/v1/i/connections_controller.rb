class Api::V1::I::ConnectionsController < Api::V1::I::BaseController

  def show
  end

  def create
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