# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::GeographicRegions::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_regions' do
    it 'lists IP detection headers' do
      stub_dt(:get, 'api/v2/rum/geographicRegions/ipDetectionHeaders',
              response: { ipDetectionHeaders: [] })
      result = client.list_regions
      expect(result['ipDetectionHeaders']).to eq([])
    end
  end

  describe '#list_ip_address_mappings' do
    it 'lists IP address mappings' do
      stub_dt(:get, 'api/v2/rum/geographicRegions/ipAddressMappings',
              response: { ipAddressMappings: [] })
      result = client.list_ip_address_mappings
      expect(result['ipAddressMappings']).to eq([])
    end
  end
end
