module User::Authenticatable
  extend ActiveSupport::Concern

  included do
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable,
            :confirmable, :trackable
  end
end
