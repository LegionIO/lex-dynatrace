# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::SettingsObjects::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_objects' do
    it 'lists settings objects' do
      stub_dt(:get, 'api/v2/settings/objects', response: { items: [], totalCount: 0 })
      result = client.list_objects
      expect(result['items']).to eq([])
    end
  end

  describe '#get_object' do
    it 'gets a settings object' do
      stub_dt(:get, 'api/v2/settings/objects/OBJ-123', response: { objectId: 'OBJ-123' })
      result = client.get_object(object_id: 'OBJ-123')
      expect(result['objectId']).to eq('OBJ-123')
    end
  end

  describe '#create_objects' do
    it 'creates settings objects' do
      stub_dt(:post, 'api/v2/settings/objects', response: [{ objectId: 'OBJ-456' }])
      result = client.create_objects(body: [{ schemaId: 'builtin:alerting', value: {} }])
      expect(result).to be_an(Array)
    end
  end

  describe '#delete_object' do
    it 'deletes a settings object' do
      stub_dt(:delete, 'api/v2/settings/objects/OBJ-123', response: '', status: 204)
      result = client.delete_object(object_id: 'OBJ-123')
      expect(result).to be_nil
    end
  end

  describe '#list_schemas' do
    it 'lists settings schemas' do
      stub_dt(:get, 'api/v2/settings/schemas', response: { items: [] })
      result = client.list_schemas
      expect(result['items']).to eq([])
    end
  end

  describe '#get_schema' do
    it 'gets a settings schema' do
      stub_dt(:get, 'api/v2/settings/schemas/builtin:alerting', response: { schemaId: 'builtin:alerting' })
      result = client.get_schema(schema_id: 'builtin:alerting')
      expect(result['schemaId']).to eq('builtin:alerting')
    end
  end
end
