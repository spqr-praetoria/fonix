require 'rails_helper'

RSpec.describe DateTimePresenter do
  let(:datetime) { Time.zone.parse("2025-03-15 14:30:00") }
  subject(:presenter) { described_class.new(datetime) }

  describe '#uk_formatted' do
    it 'formats the datetime in UK style with words' do
      Time.use_zone('UTC') do
        formatted_date = presenter.uk_formatted

        expected_format = datetime.in_time_zone("London").strftime("%e %B %Y at %l:%M %p")

        expect(formatted_date).to eq(expected_format)
        expect(formatted_date).to include("March 2025")
        expect(formatted_date).to include(" at ")
      end
    end

    it 'uses London timezone' do
      original_time = Time.zone.parse("2025-03-15 23:30:00 UTC")
      london_presenter = described_class.new(original_time)

      formatted_time = london_presenter.uk_formatted

      expect(formatted_time).to include(original_time.in_time_zone("London").strftime("%l:%M %p"))
    end
  end
end
