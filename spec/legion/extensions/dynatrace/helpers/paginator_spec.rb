# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Helpers::Paginator do
  let(:client_class) do
    Class.new do
      include Legion::Extensions::Dynatrace::Helpers::Paginator

      def initialize(pages)
        @pages = pages
        @call_count = 0
      end

      attr_reader :call_count

      def fake_list(**_params)
        page = @pages[@call_count]
        @call_count += 1
        page
      end
    end
  end

  it 'collects all pages' do
    pages = [
      { 'items' => [1, 2], 'nextPageKey' => 'page2' },
      { 'items' => [3, 4], 'nextPageKey' => 'page3' },
      { 'items' => [5], 'nextPageKey' => nil }
    ]
    client = client_class.new(pages)
    result = client.paginate(:fake_list, result_key: 'items')
    expect(result).to eq([1, 2, 3, 4, 5])
    expect(client.call_count).to eq(3)
  end

  it 'handles single page' do
    pages = [{ 'items' => [1], 'nextPageKey' => nil }]
    client = client_class.new(pages)
    result = client.paginate(:fake_list, result_key: 'items')
    expect(result).to eq([1])
  end

  it 'handles empty results' do
    pages = [{ 'items' => [], 'nextPageKey' => nil }]
    client = client_class.new(pages)
    result = client.paginate(:fake_list, result_key: 'items')
    expect(result).to eq([])
  end
end
