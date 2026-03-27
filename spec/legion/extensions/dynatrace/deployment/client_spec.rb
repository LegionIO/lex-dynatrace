# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Deployment::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#get_agent_installer_metadata' do
    it 'gets agent installer metadata' do
      stub_dt(:get, 'api/v2/deployment/installer/agent/unix/default/latest/metainfo',
              response: { latestAgentVersion: '1.261' })
      result = client.get_agent_installer_metadata(os_type: 'unix', installer_type: 'default')
      expect(result['latestAgentVersion']).to eq('1.261')
    end
  end

  describe '#get_agent_installer_connection_info' do
    it 'gets connection info' do
      stub_dt(:get, 'api/v2/deployment/installer/agent/connectioninfo',
              response: { tenantUUID: 'abc12345' })
      result = client.get_agent_installer_connection_info
      expect(result['tenantUUID']).to eq('abc12345')
    end
  end

  describe '#get_agent_versions' do
    it 'lists agent versions' do
      stub_dt(:get, 'api/v2/deployment/installer/agent/versions/unix/default',
              response: { availableVersions: ['1.261', '1.260'] })
      result = client.get_agent_versions(os_type: 'unix', installer_type: 'default')
      expect(result['availableVersions']).to be_an(Array)
    end
  end
end
