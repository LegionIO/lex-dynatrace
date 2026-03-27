# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Dql::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#execute_query' do
    it 'executes a DQL query' do
      stub_dt(:post, 'platform/storage/query/v1/query:execute',
              response: { records: [{ 'host.name': 'web-01' }], metadata: {} })
      result = client.execute_query(query: 'fetch logs | limit 10')
      expect(result['records']).to be_an(Array)
    end

    it 'supports optional timeframe parameters' do
      stub_dt(:post, 'platform/storage/query/v1/query:execute',
              response: { records: [], metadata: {} })
      result = client.execute_query(query: 'fetch metrics', default_timeframe_start: 'now-1h',
                                    default_timeframe_end: 'now')
      expect(result['records']).to eq([])
    end
  end
end
