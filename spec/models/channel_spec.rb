require 'rails_helper'

RSpec.describe Channel, type: :model do
  let(:user) { create(:user) }
  let(:channel) { create(:channel) }

  describe 'associations' do
    it { should have_many(:messages).dependent(:destroy) }

    it 'destroys associated messages when channel is destroyed' do
      create_list(:message, 3, channel: channel, user: user)

      expect { channel.destroy }.to change(Message, :count).by(-3)
    end
  end
end
