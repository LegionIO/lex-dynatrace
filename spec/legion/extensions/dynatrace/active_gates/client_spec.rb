# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::ActiveGates::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_active_gates' do
    it 'lists active gates' do
      stub_dt(:get, 'api/v2/activeGates', response: { activeGates: [] })
      result = client.list_active_gates
      expect(result['activeGates']).to eq([])
    end
  end

  describe '#get_active_gate' do
    it 'gets an active gate' do
      stub_dt(:get, 'api/v2/activeGates/AG-123', response: { id: 'AG-123' })
      result = client.get_active_gate(ag_id: 'AG-123')
      expect(result['id']).to eq('AG-123')
    end
  end

  describe '#list_update_jobs' do
    it 'lists update jobs for an active gate' do
      stub_dt(:get, 'api/v2/activeGates/AG-123/updateJobs', response: { updateJobs: [] })
      result = client.list_update_jobs(ag_id: 'AG-123')
      expect(result['updateJobs']).to eq([])
    end
  end

  describe '#get_update_job' do
    it 'gets an update job' do
      stub_dt(:get, 'api/v2/activeGates/AG-123/updateJobs/JOB-1', response: { jobId: 'JOB-1' })
      result = client.get_update_job(ag_id: 'AG-123', job_id: 'JOB-1')
      expect(result['jobId']).to eq('JOB-1')
    end
  end

  describe '#create_update_job' do
    it 'creates an update job' do
      stub_dt(:post, 'api/v2/activeGates/AG-123/updateJobs', response: { jobId: 'JOB-2' })
      result = client.create_update_job(ag_id: 'AG-123', job: { targetVersion: '1.250' })
      expect(result['jobId']).to eq('JOB-2')
    end
  end

  describe '#delete_update_job' do
    it 'deletes an update job' do
      stub_dt(:delete, 'api/v2/activeGates/AG-123/updateJobs/JOB-1', response: '', status: 204)
      result = client.delete_update_job(ag_id: 'AG-123', job_id: 'JOB-1')
      expect(result).to be_nil
    end
  end

  describe '#get_auto_update_config' do
    it 'gets auto-update configuration' do
      stub_dt(:get, 'api/v2/activeGates/autoUpdate', response: { globalSetting: 'ENABLED' })
      result = client.get_auto_update_config
      expect(result['globalSetting']).to eq('ENABLED')
    end
  end

  describe '#update_auto_update_config' do
    it 'updates auto-update configuration' do
      stub_dt(:put, 'api/v2/activeGates/autoUpdate', response: { globalSetting: 'DISABLED' })
      result = client.update_auto_update_config(config: { globalSetting: 'DISABLED' })
      expect(result['globalSetting']).to eq('DISABLED')
    end
  end
end
