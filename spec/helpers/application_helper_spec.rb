require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#current_page?' do
    let(:controller_name) { 'home' }
    let(:action_name) { 'index' }

    before do
      allow(helper).to receive(:controller_name).and_return(controller_name)
      allow(helper).to receive(:action_name).and_return(action_name)
    end

    context 'when checking controller and action together' do
      it 'returns true when both controller and action match' do
        expect(helper.current_page?('home', 'index')).to be true
      end

      it 'returns false when controller matches but action does not' do
        expect(helper.current_page?('home', 'show')).to be false
      end

      it 'returns false when action matches but controller does not' do
        expect(helper.current_page?('users', 'index')).to be false
      end

      it 'returns false when neither controller nor action match' do
        expect(helper.current_page?('users', 'show')).to be false
      end
    end

    context 'when checking only controller' do
      it 'returns true when controller matches' do
        expect(helper.current_page?('home')).to be true
      end

      it 'returns false when controller does not match' do
        expect(helper.current_page?('users')).to be false
      end
    end

    context 'with a different current page' do
      let(:controller_name) { 'devise/sessions' }
      let(:action_name) { 'new' }

      it 'correctly identifies the current page' do
        expect(helper.current_page?('devise/sessions', 'new')).to be true
        expect(helper.current_page?('home', 'index')).to be false
      end

      it 'works with the route-based helpers that would match the route' do
        expect(helper.current_page?('rails/health', 'show')).to be false
      end
    end

    context 'when options are empty' do
      it 'returns false when no controller or action is provided and options are empty' do
        expect(helper.current_page?(nil, { test: 'test' })).to be false
      end
    end
  end
end
