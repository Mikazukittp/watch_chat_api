class Api::V1::I::UsersController < ApplicationController
	##userCreate時にUsersTableにuserオブジェクトを突っ込み、userオブジェクトを返却するメソッド

	##ユーザー登録処理
	#POST /api/vi/i/users/
	def create

		@newUser = User.create(user_params)
		respond_to do |format|
				format.json { render json: @newUser } # JSON形式
			end
	end

	def user_params
 		params.permit(:name,:gcm_id)
	end

	##テストメソッド
	#GET /api/vi/a/users/hello
	def hello
		render :text => "hello"
	end
	def bye
		render :text => "byebye"
	end
end