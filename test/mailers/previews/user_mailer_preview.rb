class UserMailerPreview < ActionMailer::Preview
  def weekly_report
    user = User.first
    last_sent = Time.current - 2.days
    UserMailer.weekly_report(user.id, last_sent, 42, 100)
  end
end
