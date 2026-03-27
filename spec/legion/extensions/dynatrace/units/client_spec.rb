# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Units::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_units' do
    it 'lists units' do
      stub_dt(:get, 'api/v2/units', response: { units: [] })
      result = client.list_units
      expect(result['units']).to eq([])
    end
  end

  describe '#get_unit' do
    it 'gets a unit' do
      stub_dt(:get, 'api/v2/units/Byte', response: { unitId: 'Byte', displayName: 'byte' })
      result = client.get_unit(unit_id: 'Byte')
      expect(result['unitId']).to eq('Byte')
    end
  end

  describe '#convert_units' do
    it 'converts a unit value' do
      stub_dt(:get, 'api/v2/units/Byte/convert',
              query: { value: 1024, targetUnit: 'KiloByte' },
              response: { value: 1.0, unitId: 'KiloByte' })
      result = client.convert_units(unit_id: 'Byte', value: 1024, target_unit: 'KiloByte')
      expect(result['value']).to eq(1.0)
    end
  end
end
