# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Credentials::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_credentials' do
    it 'lists credentials' do
      stub_dt(:get, 'api/v2/credentials', response: { credentials: [] })
      result = client.list_credentials
      expect(result['credentials']).to eq([])
    end
  end

  describe '#get_credential' do
    it 'gets a credential' do
      stub_dt(:get, 'api/v2/credentials/CRED-123', response: { id: 'CRED-123', name: 'My Cert' })
      result = client.get_credential(credential_id: 'CRED-123')
      expect(result['id']).to eq('CRED-123')
    end
  end

  describe '#create_credential' do
    it 'creates a credential' do
      stub_dt(:post, 'api/v2/credentials', response: { id: 'CRED-456' })
      result = client.create_credential(credential: { name: 'New Cert', type: 'CERTIFICATE' })
      expect(result['id']).to eq('CRED-456')
    end
  end

  describe '#delete_credential' do
    it 'deletes a credential' do
      stub_dt(:delete, 'api/v2/credentials/CRED-123', response: '', status: 204)
      result = client.delete_credential(credential_id: 'CRED-123')
      expect(result).to be_nil
    end
  end
end
