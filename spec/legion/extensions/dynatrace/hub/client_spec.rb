# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Hub::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_hub_items' do
    it 'lists hub items' do
      stub_dt(:get, 'api/v2/hub/items', response: { items: [], totalCount: 0 })
      result = client.list_hub_items
      expect(result['items']).to eq([])
    end
  end

  describe '#get_hub_item' do
    it 'gets a hub item' do
      stub_dt(:get, 'api/v2/hub/items/item-123', response: { itemId: 'item-123', name: 'Test' })
      result = client.get_hub_item(item_id: 'item-123')
      expect(result['itemId']).to eq('item-123')
    end
  end
end
