# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Synthetic::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_monitors' do
    it 'lists synthetic monitors' do
      stub_dt(:get, 'api/v2/synthetic/monitors', response: { monitors: [] })
      result = client.list_monitors
      expect(result['monitors']).to eq([])
    end
  end

  describe '#get_monitor' do
    it 'gets a synthetic monitor' do
      stub_dt(:get, 'api/v2/synthetic/monitors/MON-123', response: { entityId: 'MON-123' })
      result = client.get_monitor(monitor_id: 'MON-123')
      expect(result['entityId']).to eq('MON-123')
    end
  end

  describe '#create_monitor' do
    it 'creates a synthetic monitor' do
      stub_dt(:post, 'api/v2/synthetic/monitors', response: { entityId: 'MON-456' })
      result = client.create_monitor(monitor: { name: 'Test', type: 'HTTP' })
      expect(result['entityId']).to eq('MON-456')
    end
  end

  describe '#delete_monitor' do
    it 'deletes a synthetic monitor' do
      stub_dt(:delete, 'api/v2/synthetic/monitors/MON-123', response: '', status: 204)
      result = client.delete_monitor(monitor_id: 'MON-123')
      expect(result).to be_nil
    end
  end

  describe '#list_locations' do
    it 'lists synthetic locations' do
      stub_dt(:get, 'api/v2/synthetic/locations', response: { locations: [] })
      result = client.list_locations
      expect(result['locations']).to eq([])
    end
  end

  describe '#get_execution' do
    it 'gets execution report' do
      stub_dt(:get, 'api/v2/synthetic/executions/EXEC-1/fullReport', response: { executionId: 'EXEC-1' })
      result = client.get_execution(execution_id: 'EXEC-1')
      expect(result['executionId']).to eq('EXEC-1')
    end
  end

  describe '#trigger_on_demand' do
    it 'triggers on-demand execution' do
      stub_dt(:post, 'api/v2/synthetic/executions',
              response: { triggered: [{ monitorId: 'MON-123', executionId: 'EXEC-2' }] })
      result = client.trigger_on_demand(body: { monitors: [{ monitorId: 'MON-123' }] })
      expect(result['triggered']).to be_an(Array)
    end
  end
end
