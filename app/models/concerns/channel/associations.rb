module Channel::Associations
  extend ActiveSupport::Concern

  included do
    has_many :messages, dependent: :destroy
  end
end
