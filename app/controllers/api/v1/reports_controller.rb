class Api::V1::ReportsController < Api::V1::BaseController

  def create
    @user = User.find(params[:user_id])
    @report = @user.reports.create!(report_params)

    MailMessage.report(@user,params[:content]).deliver

    render :json => @report, status: :ok
  end

  private

  def report_params
    params.permit(:content)
  end

end
