# frozen_string_literal: true

require 'webmock/rspec'
require 'legion/extensions/dynatrace'

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.order = :random
end

def stub_dt(method, path, body: nil, query: nil, status: 200, response: {})
  stub = stub_request(method, "https://test.live.dynatrace.com/#{path}")
  conditions = {}
  conditions[:body] = body if body
  conditions[:query] = query if query
  stub = stub.with(**conditions) unless conditions.empty?
  stub.to_return(status: status, body: response.to_json, headers: { 'Content-Type' => 'application/json' })
end
