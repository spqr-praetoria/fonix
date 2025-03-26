module User::Validations
  extend ActiveSupport::Concern

  included do
    validates :username, presence: true, uniqueness: true
  end
end
