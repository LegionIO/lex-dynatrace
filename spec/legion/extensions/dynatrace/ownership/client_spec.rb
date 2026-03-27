# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Ownership::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_teams' do
    it 'lists ownership teams' do
      stub_dt(:get, 'api/v2/ownership/teams', response: { teams: [], totalCount: 0 })
      result = client.list_teams
      expect(result['teams']).to eq([])
    end
  end

  describe '#get_team' do
    it 'gets a team' do
      stub_dt(:get, 'api/v2/ownership/teams/TEAM-123', response: { identifier: 'TEAM-123', name: 'Platform' })
      result = client.get_team(team_id: 'TEAM-123')
      expect(result['name']).to eq('Platform')
    end
  end

  describe '#create_team' do
    it 'creates a team' do
      stub_dt(:post, 'api/v2/ownership/teams', response: { identifier: 'TEAM-456' })
      result = client.create_team(team: { name: 'New Team', responsibilities: {} })
      expect(result['identifier']).to eq('TEAM-456')
    end
  end

  describe '#delete_team' do
    it 'deletes a team' do
      stub_dt(:delete, 'api/v2/ownership/teams/TEAM-123', response: '', status: 204)
      result = client.delete_team(team_id: 'TEAM-123')
      expect(result).to be_nil
    end
  end

  describe '#validate_ownership' do
    it 'validates entity ownership' do
      stub_dt(:get, 'api/v2/ownership/validate',
              query: { entitySelector: 'type(HOST)' },
              response: { valid: true })
      result = client.validate_ownership(entity_selector: 'type(HOST)')
      expect(result['valid']).to be(true)
    end
  end
end
