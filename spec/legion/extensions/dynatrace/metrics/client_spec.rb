# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Metrics::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_descriptors' do
    it 'lists metric descriptors' do
      stub_dt(:get, 'api/v2/metrics', response: { metrics: [] })
      result = client.list_descriptors
      expect(result).to eq({ 'metrics' => [] })
    end
  end

  describe '#get_descriptor' do
    it 'gets a metric descriptor' do
      stub_dt(:get, 'api/v2/metrics/builtin:host.cpu.usage', response: { metricId: 'builtin:host.cpu.usage' })
      result = client.get_descriptor(metric_key: 'builtin:host.cpu.usage')
      expect(result['metricId']).to eq('builtin:host.cpu.usage')
    end
  end

  describe '#query' do
    it 'queries metric data points' do
      stub_dt(:get, 'api/v2/metrics/query', query: { metricSelector: 'builtin:host.cpu.usage' },
                                            response: { result: [] })
      result = client.query(metric_selector: 'builtin:host.cpu.usage')
      expect(result).to eq({ 'result' => [] })
    end
  end

  describe '#ingest' do
    it 'ingests custom metrics' do
      stub_request(:post, 'https://test.live.dynatrace.com/api/v2/metrics/ingest')
        .to_return(status: 202, body: '{"linesOk":1,"linesInvalid":0}',
                   headers: { 'Content-Type' => 'application/json' })
      result = client.ingest(lines: ['my.metric 42'])
      expect(result['linesOk']).to eq(1)
    end
  end
end
