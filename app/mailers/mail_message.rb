class MailMessage < ActionMailer::Base
  default from: "mikazuki.ttp@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_message.report.subject
  #
  def report(user,content)
    @user = user
    @content = content

    mail to: "mikazuki.ttp@gmail.com", subject: "ActionMailer test"
  end
end
