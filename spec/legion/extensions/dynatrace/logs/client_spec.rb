# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Logs::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#search_logs' do
    it 'searches logs' do
      stub_dt(:get, 'api/v2/logs/search', query: { query: 'status:error' },
                                          response: { results: [], sliceId: 1 })
      result = client.search_logs(query: 'status:error')
      expect(result['results']).to eq([])
    end
  end

  describe '#aggregate_logs' do
    it 'aggregates logs' do
      stub_dt(:get, 'api/v2/logs/aggregate', query: { query: 'status:error', timeBuckets: 10 },
                                             response: { aggregationResult: {} })
      result = client.aggregate_logs(query: 'status:error', time_buckets: 10)
      expect(result).to have_key('aggregationResult')
    end
  end
end
