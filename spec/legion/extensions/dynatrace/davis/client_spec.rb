# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Davis::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#get_davis_analysis' do
    it 'gets Davis AI root cause analysis' do
      stub_dt(:get, 'api/v2/problems/P-123',
              query: { fields: '+evidenceDetails,+impactAnalysis,+rootCauseEntity' },
              response: { problemId: 'P-123', evidenceDetails: {}, rootCauseEntity: {} })
      result = client.get_davis_analysis(problem_id: 'P-123')
      expect(result['problemId']).to eq('P-123')
      expect(result).to have_key('evidenceDetails')
    end
  end
end
