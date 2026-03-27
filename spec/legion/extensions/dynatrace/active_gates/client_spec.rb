# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::ActiveGates::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_active_gates' do
    it 'lists active gates' do
      stub_dt(:get, 'api/v2/activeGates', response: { activeGates: [] })
      result = client.list_active_gates
      expect(result['activeGates']).to eq([])
    end
  end

  describe '#get_active_gate' do
    it 'gets an active gate' do
      stub_dt(:get, 'api/v2/activeGates/AG-123', response: { id: 'AG-123' })
      result = client.get_active_gate(ag_id: 'AG-123')
      expect(result['id']).to eq('AG-123')
    end
  end
end
