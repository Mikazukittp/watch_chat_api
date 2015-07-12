class Api::V1::A::UsersController < ApplicationController
	##userCreate時にUsersTableにuserオブジェクトを突っ込み、userオブジェクトを返却するメソッド

	##テストメソッド。ユーザーオブジェクトをJSONで表示
	#GET /api/vi/a/users/1.json/
	def show
		@usershow = User.find(params[:id])
			respond_to do |format|
				format.json { render json: @usershow } # JSON形式
			end
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