require 'rails_helper'

RSpec.describe UserPresenter do
  subject(:presenter) { described_class.new(user) }

  describe '#initials' do
    context 'when username is present' do
      let(:user) { create(:user, :with_name) }

      it 'returns capitalized initials' do
        expect(presenter.initials).to eq('JD')
      end

      context 'with custom limit' do
        let(:user) { create(:user, :with_three_part_name) }

        it 'returns the specified number of initials' do
          expect(presenter.initials(limit: 3)).to eq('JMD')
        end
      end
    end

    context 'when username has extra spaces' do
      let(:user) { create(:user, :with_spaced_name) }

      it 'handles extra spaces correctly' do
        expect(presenter.initials).to eq('JD')
      end
    end

    context 'when an error occurs' do
      let(:user) { create(:user) }

      before do
        allow(user).to receive(:username).and_raise(StandardError)
      end

      it 'returns XX' do
        expect(presenter.initials).to eq('XX')
      end
    end
  end
end
