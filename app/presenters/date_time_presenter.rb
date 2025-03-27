class DateTimePresenter
  # UK-formatted date with words (e.g., "5 March 2024 at 2:30 PM")
  def uk_formatted
    datetime.in_time_zone("London").strftime("%e %B %Y at %l:%M %p")
  end

  private

  attr_reader :datetime

  def initialize(datetime)
    @datetime = datetime
  end
end
