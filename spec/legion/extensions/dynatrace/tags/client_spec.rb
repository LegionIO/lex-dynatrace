# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Tags::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#get_tags' do
    it 'gets tags for entities' do
      stub_dt(:get, 'api/v2/tags', query: { entitySelector: 'type(HOST)' },
                                   response: { tags: [{ key: 'env', value: 'prod' }] })
      result = client.get_tags(entity_selector: 'type(HOST)')
      expect(result['tags'].first['key']).to eq('env')
    end
  end

  describe '#add_tags' do
    it 'adds tags to entities' do
      stub_request(:post, 'https://test.live.dynatrace.com/api/v2/tags?entitySelector=type%28HOST%29')
        .to_return(status: 200, body: '{"matchedEntitiesCount":3}',
                   headers: { 'Content-Type' => 'application/json' })
      result = client.add_tags(entity_selector: 'type(HOST)', tags: [{ key: 'team', value: 'grid' }])
      expect(result['matchedEntitiesCount']).to eq(3)
    end
  end

  describe '#delete_tag' do
    it 'deletes a tag' do
      stub_dt(:delete, 'api/v2/tags/env',
              query: { entitySelector: 'type(HOST)', value: 'staging' },
              response: '', status: 204)
      result = client.delete_tag(key: 'env', entity_selector: 'type(HOST)', value: 'staging')
      expect(result).to be_nil
    end
  end
end
