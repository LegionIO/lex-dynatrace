# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::BusinessEvents::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#ingest_business_event' do
    it 'ingests a business event' do
      stub_request(:post, 'https://test.live.dynatrace.com/api/v2/bizevents/ingest')
        .to_return(status: 202, body: '', headers: {})
      result = client.ingest_business_event(data: { type: 'com.example.purchase', source: 'shop' })
      expect(result).to(satisfy { |v| v.nil? || v == '' })
    end
  end

  describe '#ingest_business_events_batch' do
    it 'ingests a batch of business events' do
      stub_request(:post, 'https://test.live.dynatrace.com/api/v2/bizevents/ingest')
        .to_return(status: 202, body: '', headers: {})
      events = [{ type: 'com.example.purchase' }, { type: 'com.example.refund' }]
      result = client.ingest_business_events_batch(events: events)
      expect(result).to(satisfy { |v| v.nil? || v == '' })
    end
  end
end
