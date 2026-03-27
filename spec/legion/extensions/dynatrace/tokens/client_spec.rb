# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Tokens::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_tokens' do
    it 'lists API tokens' do
      stub_dt(:get, 'api/v2/apiTokens', response: { apiTokens: [] })
      result = client.list_tokens
      expect(result['apiTokens']).to eq([])
    end
  end

  describe '#get_token' do
    it 'gets an API token' do
      stub_dt(:get, 'api/v2/apiTokens/TK-123', response: { id: 'TK-123', name: 'My Token' })
      result = client.get_token(token_id: 'TK-123')
      expect(result['name']).to eq('My Token')
    end
  end

  describe '#create_token' do
    it 'creates an API token' do
      stub_dt(:post, 'api/v2/apiTokens', response: { id: 'TK-456', token: 'dt0c01.new' })
      result = client.create_token(name: 'CI Token', scopes: ['metrics.read'])
      expect(result['id']).to eq('TK-456')
    end
  end

  describe '#delete_token' do
    it 'deletes an API token' do
      stub_dt(:delete, 'api/v2/apiTokens/TK-123', response: '', status: 204)
      result = client.delete_token(token_id: 'TK-123')
      expect(result).to be_nil
    end
  end

  describe '#lookup_token' do
    it 'looks up a token' do
      stub_dt(:post, 'api/v2/apiTokens/lookup', response: { id: 'TK-123', name: 'My Token' })
      result = client.lookup_token(token: 'dt0c01.test')
      expect(result['name']).to eq('My Token')
    end
  end
end
