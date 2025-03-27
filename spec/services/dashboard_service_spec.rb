require 'rails_helper'

RSpec.describe DashboardService do
  let(:current_user) { create(:user) }
  let(:service) { described_class.new(current_user) }

  describe '#fetch' do
    context 'when a channel exists' do
      let!(:channel) { create(:channel) }
      let!(:messages) { create_list(:message, 3, user: current_user, channel: channel) }
      let!(:users) { create_list(:user, 2) }

      it 'returns the correct dashboard data' do
        result = service.fetch

        expect(result[:channel]).to eq(channel)
        expect(result[:messages].count).to eq(3)
        expect(result[:users].count).to eq(2)
        expect(result[:users_count]).to eq(2)
      end

      it 'excludes the current user from users list' do
        result = service.fetch

        expect(result[:users]).not_to include(current_user)
      end

      it 'orders messages by created_at in ascending order' do
        result = service.fetch

        expect(result[:messages].first.created_at).to be >= result[:messages].last.created_at
      end
    end

    context 'when no channel exists' do
      it 'returns a NullChannel' do
        result = service.fetch

        expect(result[:channel]).to be_a(NullChannel)
        expect(result[:channel].name).to eq('No Channel')
      end

      it 'handles nil relationships gracefully' do
        result = service.fetch

        expect(result[:messages]).to be_nil
      end
    end
  end

  describe 'NullChannel' do
    it 'has a default name' do
      null_channel = NullChannel.new
      expect(null_channel.name).to eq('No Channel')
    end
  end
end
