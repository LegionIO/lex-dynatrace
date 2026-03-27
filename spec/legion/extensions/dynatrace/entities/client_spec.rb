# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Entities::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_entities' do
    it 'lists entities' do
      stub_dt(:get, 'api/v2/entities', response: { entities: [], totalCount: 0 })
      result = client.list_entities
      expect(result['entities']).to eq([])
    end
  end

  describe '#get_entity' do
    it 'gets an entity' do
      stub_dt(:get, 'api/v2/entities/HOST-ABC123', response: { entityId: 'HOST-ABC123', type: 'HOST' })
      result = client.get_entity(entity_id: 'HOST-ABC123')
      expect(result['entityId']).to eq('HOST-ABC123')
    end
  end

  describe '#list_entity_types' do
    it 'lists entity types' do
      stub_dt(:get, 'api/v2/entityTypes', response: { types: [] })
      result = client.list_entity_types
      expect(result['types']).to eq([])
    end
  end

  describe '#get_entity_type' do
    it 'gets an entity type' do
      stub_dt(:get, 'api/v2/entityTypes/HOST', response: { type: 'HOST' })
      result = client.get_entity_type(type: 'HOST')
      expect(result['type']).to eq('HOST')
    end
  end

  describe '#push_custom_device' do
    it 'pushes a custom device' do
      stub_dt(:post, 'api/v2/entities/custom',
              response: { entityId: 'CUSTOM_DEVICE-123' })
      result = client.push_custom_device(body: { displayName: 'my-device', type: 'CUSTOM_DEVICE' })
      expect(result['entityId']).to eq('CUSTOM_DEVICE-123')
    end
  end
end
