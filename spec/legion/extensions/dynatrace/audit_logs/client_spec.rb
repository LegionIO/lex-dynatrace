# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::AuditLogs::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_audit_logs' do
    it 'lists audit logs' do
      stub_dt(:get, 'api/v2/auditlogs', response: { auditLogs: [], totalCount: 0 })
      result = client.list_audit_logs
      expect(result['auditLogs']).to eq([])
    end
  end

  describe '#get_audit_log' do
    it 'gets an audit log entry' do
      stub_dt(:get, 'api/v2/auditlogs/AL-123', response: { logId: 'AL-123' })
      result = client.get_audit_log(log_id: 'AL-123')
      expect(result['logId']).to eq('AL-123')
    end
  end
end
