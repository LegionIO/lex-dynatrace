# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Extensions20::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_extensions' do
    it 'lists extensions' do
      stub_dt(:get, 'api/v2/extensions', response: { extensions: [] })
      result = client.list_extensions
      expect(result['extensions']).to eq([])
    end
  end

  describe '#get_extension' do
    it 'gets extension versions' do
      stub_dt(:get, 'api/v2/extensions/com.dynatrace.extension.host',
              response: { extensionName: 'com.dynatrace.extension.host' })
      result = client.get_extension(extension_name: 'com.dynatrace.extension.host')
      expect(result['extensionName']).to eq('com.dynatrace.extension.host')
    end
  end

  describe '#get_environment_config' do
    it 'gets environment configuration' do
      stub_dt(:get, 'api/v2/extensions/com.dynatrace.extension.host/environmentConfiguration',
              response: { version: '1.0.0' })
      result = client.get_environment_config(extension_name: 'com.dynatrace.extension.host')
      expect(result['version']).to eq('1.0.0')
    end
  end

  describe '#list_monitoring_configs' do
    it 'lists monitoring configurations' do
      stub_dt(:get, 'api/v2/extensions/com.dynatrace.extension.host/monitoringConfigurations',
              response: { items: [] })
      result = client.list_monitoring_configs(extension_name: 'com.dynatrace.extension.host')
      expect(result['items']).to eq([])
    end
  end

  describe '#create_monitoring_config' do
    it 'creates a monitoring configuration' do
      stub_dt(:post, 'api/v2/extensions/com.dynatrace.extension.host/monitoringConfigurations',
              response: { objectId: 'MC-1' })
      result = client.create_monitoring_config(extension_name: 'com.dynatrace.extension.host',
                                               config: { scope: 'environment' })
      expect(result['objectId']).to eq('MC-1')
    end
  end

  describe '#delete_extension' do
    it 'deletes an extension' do
      stub_dt(:delete, 'api/v2/extensions/com.dynatrace.extension.host', response: {})
      result = client.delete_extension(extension_name: 'com.dynatrace.extension.host')
      expect(result).to eq({})
    end
  end
end
