# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::ActivegateTokens::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_activegate_tokens' do
    it 'lists ActiveGate tokens' do
      stub_dt(:get, 'api/v2/activeGateTokens', response: { activeGateTokens: [], totalCount: 0 })
      result = client.list_activegate_tokens
      expect(result['activeGateTokens']).to eq([])
    end
  end

  describe '#get_activegate_token' do
    it 'gets an ActiveGate token' do
      stub_dt(:get, 'api/v2/activeGateTokens/AGT-123', response: { id: 'AGT-123', name: 'My AG Token' })
      result = client.get_activegate_token(token_id: 'AGT-123')
      expect(result['name']).to eq('My AG Token')
    end
  end

  describe '#create_activegate_token' do
    it 'creates an ActiveGate token' do
      stub_dt(:post, 'api/v2/activeGateTokens', response: { id: 'AGT-456', token: 'dt0g02.new' })
      result = client.create_activegate_token(name: 'New AG Token')
      expect(result['id']).to eq('AGT-456')
    end
  end

  describe '#revoke_activegate_token' do
    it 'revokes an ActiveGate token' do
      stub_dt(:delete, 'api/v2/activeGateTokens/AGT-123', response: '', status: 204)
      result = client.revoke_activegate_token(token_id: 'AGT-123')
      expect(result).to be_nil
    end
  end
end
