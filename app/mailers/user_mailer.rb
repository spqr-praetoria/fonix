class UserMailer < ApplicationMailer
  def weekly_report(user_id, last_sent_at, messages_since_last, total_messages)
    @user = User.find(user_id)
    @last_sent_at = last_sent_at
    @messages_since_last = messages_since_last
    @total_messages = total_messages

    mail(
      to: @user.email,
      subject: "Your Weekly Message Report"
    )
  end
end
