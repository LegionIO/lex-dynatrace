# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::SecurityProblems::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_security_problems' do
    it 'lists security problems' do
      stub_dt(:get, 'api/v2/securityProblems', response: { securityProblems: [], totalCount: 0 })
      result = client.list_security_problems
      expect(result['securityProblems']).to eq([])
    end
  end

  describe '#get_security_problem' do
    it 'gets a security problem' do
      stub_dt(:get, 'api/v2/securityProblems/SP-123', response: { securityProblemId: 'SP-123' })
      result = client.get_security_problem(security_problem_id: 'SP-123')
      expect(result['securityProblemId']).to eq('SP-123')
    end
  end

  describe '#mute_security_problem' do
    it 'mutes a security problem' do
      stub_dt(:post, 'api/v2/securityProblems/SP-123/mute', response: {}, status: 200)
      result = client.mute_security_problem(security_problem_id: 'SP-123', reason: 'FALSE_POSITIVE')
      expect(result).to eq({})
    end
  end

  describe '#unmute_security_problem' do
    it 'unmutes a security problem' do
      stub_dt(:post, 'api/v2/securityProblems/SP-123/unmute', response: {}, status: 200)
      result = client.unmute_security_problem(security_problem_id: 'SP-123', reason: 'AFFECTED')
      expect(result).to eq({})
    end
  end

  describe '#list_remediations' do
    it 'lists remediations' do
      stub_dt(:get, 'api/v2/securityProblems/SP-123/remediationItems', response: { remediationItems: [] })
      result = client.list_remediations(security_problem_id: 'SP-123')
      expect(result['remediationItems']).to eq([])
    end
  end

  describe '#get_remediation_item' do
    it 'gets a remediation item' do
      stub_dt(:get, 'api/v2/securityProblems/SP-123/remediationItems/RI-1',
              response: { id: 'RI-1', vulnerableComponent: 'log4j' })
      result = client.get_remediation_item(security_problem_id: 'SP-123', remediation_id: 'RI-1')
      expect(result['id']).to eq('RI-1')
    end
  end
end
