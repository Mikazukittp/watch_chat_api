class Api::V1::UsersController < ApplicationController
	##userCreate時にUsersTableにuserオブジェクトを突っ込み、userオブジェクトを返却するメソッド

	def show
        @user = User.find(params[:id])
        render json: @user
    end
	##ユーザー登録処理
	#POST /api/vi/a/users/
	def create
		@newUser = User.create(user_params)
		render :json => @newUser, status: :created # JSON形式
	end

	def opponent
        @user = User.find(params[:id])
        @opponent = User.find(@user.relation_id)
        render json: @opponent
    end

    private

	def user_params
 		params.permit(:name, :gcm_id, :device_type)
	end

end