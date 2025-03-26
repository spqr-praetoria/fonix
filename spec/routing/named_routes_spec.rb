require 'rails_helper'

RSpec.describe 'Named Routes', type: :routing do
  it 'has a named route for health check' do
    expect(rails_health_check_path).to eq('/up')
  end

  it 'has a named route for root' do
    expect(root_path).to eq('/')
  end

  # Devise named routes
  it 'has named routes for Devise' do
    expect(new_user_session_path).to eq('/users/sign_in')
    expect(new_user_registration_path).to eq('/users/sign_up')
    expect(new_user_password_path).to eq('/users/password/new')
    expect(new_user_confirmation_path).to eq('/users/confirmation/new')
  end
end
