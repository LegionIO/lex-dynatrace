# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Events::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_events' do
    it 'lists events' do
      stub_dt(:get, 'api/v2/events', response: { events: [], totalCount: 0 })
      result = client.list_events
      expect(result['events']).to eq([])
    end
  end

  describe '#get_event' do
    it 'gets an event' do
      stub_dt(:get, 'api/v2/events/E-123', response: { eventId: 'E-123' })
      result = client.get_event(event_id: 'E-123')
      expect(result['eventId']).to eq('E-123')
    end
  end

  describe '#ingest_event' do
    it 'ingests a custom event' do
      stub_dt(:post, 'api/v2/events/ingest', response: { reportCount: 1 })
      result = client.ingest_event(event_type: 'CUSTOM_DEPLOYMENT', title: 'Deploy v1.2')
      expect(result['reportCount']).to eq(1)
    end
  end
end
