# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::OpenPipeline::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_pipelines' do
    it 'lists pipeline configurations' do
      stub_dt(:get, 'api/v2/openpipeline/configurations', response: { pipelines: [] })
      result = client.list_pipelines
      expect(result['pipelines']).to eq([])
    end
  end

  describe '#get_pipeline' do
    it 'gets a pipeline configuration' do
      stub_dt(:get, 'api/v2/openpipeline/configurations/logs', response: { id: 'logs', pipelines: [] })
      result = client.get_pipeline(pipeline_id: 'logs')
      expect(result['id']).to eq('logs')
    end
  end

  describe '#update_pipeline' do
    it 'updates a pipeline configuration' do
      stub_dt(:put, 'api/v2/openpipeline/configurations/logs', response: { id: 'logs' })
      result = client.update_pipeline(pipeline_id: 'logs', config: { pipelines: [] })
      expect(result['id']).to eq('logs')
    end
  end
end
