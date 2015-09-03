# Preview all emails at http://localhost:3000/rails/mailers/mail_message
class MailMessagePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mail_message/report
  def report
    MailMessage.report
  end

end
