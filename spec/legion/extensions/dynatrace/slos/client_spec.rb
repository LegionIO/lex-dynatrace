# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Slos::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_slos' do
    it 'lists SLOs' do
      stub_dt(:get, 'api/v2/slo', response: { slo: [], totalCount: 0 })
      result = client.list_slos
      expect(result['slo']).to eq([])
    end
  end

  describe '#get_slo' do
    it 'gets an SLO' do
      stub_dt(:get, 'api/v2/slo/SLO-123', response: { id: 'SLO-123', name: 'Availability' })
      result = client.get_slo(slo_id: 'SLO-123')
      expect(result['id']).to eq('SLO-123')
    end
  end

  describe '#create_slo' do
    it 'creates an SLO' do
      stub_dt(:post, 'api/v2/slo', response: { id: 'SLO-456' })
      result = client.create_slo(slo: { name: 'Latency', target: 99.9 })
      expect(result['id']).to eq('SLO-456')
    end
  end

  describe '#update_slo' do
    it 'updates an SLO' do
      stub_dt(:put, 'api/v2/slo/SLO-123', response: '', status: 204)
      result = client.update_slo(slo_id: 'SLO-123', slo: { target: 99.95 })
      expect(result).to be_nil
    end
  end

  describe '#delete_slo' do
    it 'deletes an SLO' do
      stub_dt(:delete, 'api/v2/slo/SLO-123', response: '', status: 204)
      result = client.delete_slo(slo_id: 'SLO-123')
      expect(result).to be_nil
    end
  end
end
