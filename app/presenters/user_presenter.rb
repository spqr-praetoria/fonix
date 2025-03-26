class UserPresenter < SimpleDelegator
  def initials(limit: 2)
    return "XX" if username.blank?

    username.split
           .reject(&:blank?)
           .first(limit)
           .map(&:first)
           .join
           .upcase
  rescue
    "XX"
  end
end
