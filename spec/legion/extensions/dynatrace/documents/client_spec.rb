# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Documents::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_documents' do
    it 'lists documents' do
      stub_dt(:get, 'api/v2/documents', response: { documents: [], totalCount: 0 })
      result = client.list_documents
      expect(result['documents']).to eq([])
    end
  end

  describe '#get_document' do
    it 'gets a document' do
      stub_dt(:get, 'api/v2/documents/doc-123', response: { id: 'doc-123', name: 'Dashboard' })
      result = client.get_document(document_id: 'doc-123')
      expect(result['id']).to eq('doc-123')
    end
  end

  describe '#create_document' do
    it 'creates a document' do
      stub_dt(:post, 'api/v2/documents', response: { id: 'doc-456' })
      result = client.create_document(document: { name: 'New Dashboard', type: 'dashboard' })
      expect(result['id']).to eq('doc-456')
    end
  end

  describe '#delete_document' do
    it 'deletes a document' do
      stub_dt(:delete, 'api/v2/documents/doc-123', response: '', status: 204)
      result = client.delete_document(document_id: 'doc-123')
      expect(result).to be_nil
    end
  end
end
