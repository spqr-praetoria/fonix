class WeeklyReport < ApplicationRecord
  self.table_name = "weekly_reports"
  self.primary_key = "user_id"

  def self.messages_since_last_user_message
    Message
      .select(
        "users.id as user_id",
        "COUNT(other_messages.id) as messages_since_last"
      )
      .joins(:user)
      .joins(<<-SQL)
        LEFT JOIN messages as user_last_message ON#{' '}
          user_last_message.user_id = users.id
        LEFT JOIN messages as other_messages ON
          other_messages.created_at > user_last_message.created_at
      SQL
      .group("users.id")
  end
end
