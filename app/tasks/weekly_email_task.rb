class WeeklyEmailTask
  def initialize
    @start_date = Date.today.beginning_of_week
    @end_date = Date.today.end_of_week
  end

  def run
    messages = Message.where(created_at: @start_date..@end_date)
    total_messages = messages.count

    hash = User.confirmed.logged_in_within_last_week.eager_load(:messages).each_with_object({}) do |user, memo|
      user_last_sent_at = user.messages.maximum(:created_at)

      memo[user.id] = {
        last_sent: user_last_sent_at,
        messages_since_last: messages.where("created_at > ?", user_last_sent_at).count
      }
    end

    puts "Sending emails to #{hash.size} users"

    hash.each do |user_id, data|
      UserMailer.weekly_report(user_id, data[:last_sent], data[:messages_since_last], total_messages).deliver_later
    end
  end
end
