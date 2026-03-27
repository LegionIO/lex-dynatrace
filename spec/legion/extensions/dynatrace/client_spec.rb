# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace::Client do
  subject(:client) { described_class.new(environment_url: 'https://test.live.dynatrace.com', api_token: 'dt0c01.test') }

  it 'responds to metrics methods' do
    expect(client).to respond_to(:list_descriptors)
    expect(client).to respond_to(:query)
  end

  it 'responds to entity methods' do
    expect(client).to respond_to(:list_entities)
    expect(client).to respond_to(:get_entity)
  end

  it 'responds to problem methods' do
    expect(client).to respond_to(:list_problems)
    expect(client).to respond_to(:close_problem)
  end

  it 'responds to event methods' do
    expect(client).to respond_to(:list_events)
    expect(client).to respond_to(:ingest_event)
  end

  it 'responds to log methods' do
    expect(client).to respond_to(:search_logs)
  end

  it 'responds to all sub-module methods' do
    expect(client).to respond_to(:list_audit_logs)
    expect(client).to respond_to(:list_active_gates)
    expect(client).to respond_to(:list_extensions)
    expect(client).to respond_to(:list_slos)
    expect(client).to respond_to(:list_monitors)
    expect(client).to respond_to(:list_locations)
    expect(client).to respond_to(:list_security_problems)
    expect(client).to respond_to(:list_objects)
    expect(client).to respond_to(:list_schemas)
    expect(client).to respond_to(:list_network_zones)
    expect(client).to respond_to(:get_tags)
    expect(client).to respond_to(:list_tokens)
    expect(client).to respond_to(:list_releases)
    expect(client).to respond_to(:list_attacks)
    expect(client).to respond_to(:ingest_business_event)
    expect(client).to respond_to(:list_credentials)
    expect(client).to respond_to(:get_agent_installer_connection_info)
    expect(client).to respond_to(:list_units)
    expect(client).to respond_to(:list_regions)
  end
end
