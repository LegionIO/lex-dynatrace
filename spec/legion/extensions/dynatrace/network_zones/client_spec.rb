# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::NetworkZones::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_network_zones' do
    it 'lists network zones' do
      stub_dt(:get, 'api/v2/networkZones', response: { networkZones: [] })
      result = client.list_network_zones
      expect(result['networkZones']).to eq([])
    end
  end

  describe '#get_network_zone' do
    it 'gets a network zone' do
      stub_dt(:get, 'api/v2/networkZones/default', response: { id: 'default' })
      result = client.get_network_zone(network_zone_id: 'default')
      expect(result['id']).to eq('default')
    end
  end

  describe '#create_network_zone' do
    it 'creates a network zone' do
      stub_dt(:put, 'api/v2/networkZones/myzone', response: { id: 'myzone' })
      result = client.create_network_zone(network_zone_id: 'myzone', body: { description: 'test' })
      expect(result['id']).to eq('myzone')
    end
  end

  describe '#delete_network_zone' do
    it 'deletes a network zone' do
      stub_dt(:delete, 'api/v2/networkZones/myzone', response: '', status: 204)
      result = client.delete_network_zone(network_zone_id: 'myzone')
      expect(result).to be_nil
    end
  end
end
