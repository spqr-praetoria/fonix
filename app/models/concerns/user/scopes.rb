module User::Scopes
  extend ActiveSupport::Concern

  included do
    scope :confirmed, -> { where.not(confirmed_at: nil) }
    scope :logged_in_within_last_week, -> { where("last_sign_in_at > ?", 1.week.ago) }
  end
end
