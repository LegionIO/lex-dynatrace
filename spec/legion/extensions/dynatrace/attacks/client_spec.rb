# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Attacks::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_attacks' do
    it 'lists attacks' do
      stub_dt(:get, 'api/v2/attacks', response: { attacks: [], totalCount: 0 })
      result = client.list_attacks
      expect(result['attacks']).to eq([])
    end
  end

  describe '#get_attack' do
    it 'gets an attack' do
      stub_dt(:get, 'api/v2/attacks/ATK-123', response: { attackId: 'ATK-123' })
      result = client.get_attack(attack_id: 'ATK-123')
      expect(result['attackId']).to eq('ATK-123')
    end
  end
end
