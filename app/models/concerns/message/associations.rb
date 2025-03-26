module Message::Associations
  extend ActiveSupport::Concern

  included do
    belongs_to :user
    belongs_to :channel
  end
end
