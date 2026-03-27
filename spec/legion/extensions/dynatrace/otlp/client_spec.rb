# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Otlp::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#ingest_traces' do
    it 'ingests OTLP traces' do
      stub_dt(:post, 'api/v2/otlp/v1/traces', response: {}, status: 200)
      result = client.ingest_traces(traces: { resourceSpans: [] })
      expect(result).to eq({})
    end
  end

  describe '#ingest_otlp_metrics' do
    it 'ingests OTLP metrics' do
      stub_dt(:post, 'api/v2/otlp/v1/metrics', response: {}, status: 200)
      result = client.ingest_otlp_metrics(metrics: { resourceMetrics: [] })
      expect(result).to eq({})
    end
  end

  describe '#ingest_otlp_logs' do
    it 'ingests OTLP logs' do
      stub_dt(:post, 'api/v2/otlp/v1/logs', response: {}, status: 200)
      result = client.ingest_otlp_logs(logs: { resourceLogs: [] })
      expect(result).to eq({})
    end
  end
end
