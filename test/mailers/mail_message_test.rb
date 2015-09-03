require 'test_helper'

class MailMessageTest < ActionMailer::TestCase
  test "report" do
    mail = MailMessage.report
    assert_equal "Report", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
