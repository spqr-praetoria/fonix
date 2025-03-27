class DashboardService
  def initialize(current_user)
    @current_user = current_user
  end

  def fetch
    {
      channel: channel || NullChannel.new,
      messages: messages&.eager_load(:user)&.order(updated_at: :desc),
      users: users&.order(last_sign_in_at: :asc),
      users_count: users_count
    }
  end

  private

  attr_reader :current_user

  def channel
    @channel ||= Channel.first
  end

  def messages
    @messages ||= channel&.messages
  end

  def users
    @users ||= User.excluding(current_user)
  end

  def users_count
    @users_count ||= users&.count
  end
end

class NullChannel
  def name
    "No Channel"
  end
end
