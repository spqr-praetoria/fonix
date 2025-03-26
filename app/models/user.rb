class User < ApplicationRecord
  include User::Authenticatable
  include User::Validations
  include User::Associations
end
