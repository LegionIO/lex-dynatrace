# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Releases::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_releases' do
    it 'lists releases' do
      stub_dt(:get, 'api/v2/releases', response: { releases: [], totalCount: 0 })
      result = client.list_releases
      expect(result['releases']).to eq([])
    end
  end

  describe '#get_release' do
    it 'gets a release' do
      stub_dt(:get, 'api/v2/releases/REL-123', response: { releaseId: 'REL-123' })
      result = client.get_release(release_id: 'REL-123')
      expect(result['releaseId']).to eq('REL-123')
    end
  end
end
