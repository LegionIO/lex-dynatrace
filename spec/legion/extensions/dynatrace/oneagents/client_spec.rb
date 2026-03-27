# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Oneagents::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_oneagents' do
    it 'lists OneAgents' do
      stub_dt(:get, 'api/v2/oneagents', response: { oneAgents: [], totalCount: 0 })
      result = client.list_oneagents
      expect(result['oneAgents']).to eq([])
    end
  end
end
