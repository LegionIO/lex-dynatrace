# frozen_string_literal: true

require_relative 'dynatrace/version'
require_relative 'dynatrace/helpers/client'
require_relative 'dynatrace/base_client'
require_relative 'dynatrace/metrics'
require_relative 'dynatrace/entities'
require_relative 'dynatrace/problems'
require_relative 'dynatrace/events'
require_relative 'dynatrace/logs'
require_relative 'dynatrace/audit_logs'
require_relative 'dynatrace/active_gates'
require_relative 'dynatrace/extensions20'
require_relative 'dynatrace/slos'
require_relative 'dynatrace/synthetic'
require_relative 'dynatrace/security_problems'
require_relative 'dynatrace/settings_objects'
require_relative 'dynatrace/network_zones'
require_relative 'dynatrace/tags'
require_relative 'dynatrace/tokens'
require_relative 'dynatrace/releases'
require_relative 'dynatrace/attacks'
require_relative 'dynatrace/business_events'
require_relative 'dynatrace/credentials'
require_relative 'dynatrace/deployment'
require_relative 'dynatrace/units'
require_relative 'dynatrace/geographic_regions'
require_relative 'dynatrace/helpers/paginator'
require_relative 'dynatrace/client'

module Legion
  module Extensions
    module Dynatrace
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
