# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Problems::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  describe '#list_problems' do
    it 'lists problems' do
      stub_dt(:get, 'api/v2/problems', response: { problems: [], totalCount: 0 })
      result = client.list_problems
      expect(result['problems']).to eq([])
    end
  end

  describe '#get_problem' do
    it 'gets a problem' do
      stub_dt(:get, 'api/v2/problems/P-123', response: { problemId: 'P-123', status: 'OPEN' })
      result = client.get_problem(problem_id: 'P-123')
      expect(result['problemId']).to eq('P-123')
    end
  end

  describe '#close_problem' do
    it 'closes a problem' do
      stub_dt(:post, 'api/v2/problems/P-123/close', response: { problemId: 'P-123' })
      result = client.close_problem(problem_id: 'P-123', message: 'resolved')
      expect(result['problemId']).to eq('P-123')
    end
  end

  describe '#list_comments' do
    it 'lists comments' do
      stub_dt(:get, 'api/v2/problems/P-123/comments', response: { comments: [] })
      result = client.list_comments(problem_id: 'P-123')
      expect(result['comments']).to eq([])
    end
  end

  describe '#create_comment' do
    it 'creates a comment' do
      stub_dt(:post, 'api/v2/problems/P-123/comments', response: { id: 'C-1' })
      result = client.create_comment(problem_id: 'P-123', message: 'investigating')
      expect(result['id']).to eq('C-1')
    end
  end

  describe '#update_comment' do
    it 'updates a comment' do
      stub_dt(:put, 'api/v2/problems/P-123/comments/C-1', response: { id: 'C-1', message: 'updated' })
      result = client.update_comment(problem_id: 'P-123', comment_id: 'C-1', message: 'updated')
      expect(result['message']).to eq('updated')
    end
  end

  describe '#delete_comment' do
    it 'deletes a comment' do
      stub_dt(:delete, 'api/v2/problems/P-123/comments/C-1', response: '', status: 204)
      result = client.delete_comment(problem_id: 'P-123', comment_id: 'C-1')
      expect(result).to be_nil
    end
  end
end
