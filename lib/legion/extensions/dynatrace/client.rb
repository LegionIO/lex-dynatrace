# frozen_string_literal: true

require_relative 'helpers/client'
require_relative 'base_client'
require_relative 'metrics/runners/metrics'
require_relative 'entities/runners/entities'
require_relative 'problems/runners/problems'
require_relative 'events/runners/events'
require_relative 'logs/runners/logs'
require_relative 'audit_logs/runners/audit_logs'
require_relative 'active_gates/runners/active_gates'
require_relative 'extensions20/runners/extensions'
require_relative 'slos/runners/slos'
require_relative 'synthetic/runners/monitors'
require_relative 'synthetic/runners/locations'
require_relative 'security_problems/runners/security_problems'
require_relative 'settings_objects/runners/objects'
require_relative 'settings_objects/runners/schemas'
require_relative 'network_zones/runners/network_zones'
require_relative 'tags/runners/tags'
require_relative 'tokens/runners/tokens'
require_relative 'releases/runners/releases'
require_relative 'attacks/runners/attacks'
require_relative 'business_events/runners/business_events'
require_relative 'credentials/runners/credentials'
require_relative 'deployment/runners/deployment'
require_relative 'units/runners/units'
require_relative 'geographic_regions/runners/geographic_regions'
require_relative 'oneagents/runners/oneagents'
require_relative 'davis/runners/davis'
require_relative 'helpers/paginator'

module Legion
  module Extensions
    module Dynatrace
      class Client < BaseClient
        include Helpers::Paginator
        include Metrics::Runners::Metrics
        include Entities::Runners::Entities
        include Problems::Runners::Problems
        include Events::Runners::Events
        include Logs::Runners::Logs
        include AuditLogs::Runners::AuditLogs
        include ActiveGates::Runners::ActiveGates
        include Extensions20::Runners::Extensions
        include Slos::Runners::Slos
        include Synthetic::Runners::Monitors
        include Synthetic::Runners::Locations
        include SecurityProblems::Runners::SecurityProblems
        include SettingsObjects::Runners::Objects
        include SettingsObjects::Runners::Schemas
        include NetworkZones::Runners::NetworkZones
        include Tags::Runners::Tags
        include Tokens::Runners::Tokens
        include Releases::Runners::Releases
        include Attacks::Runners::Attacks
        include BusinessEvents::Runners::BusinessEvents
        include Credentials::Runners::Credentials
        include Deployment::Runners::Deployment
        include Units::Runners::Units
        include GeographicRegions::Runners::GeographicRegions
        include Oneagents::Runners::Oneagents
        include Davis::Runners::Davis
      end
    end
  end
end
