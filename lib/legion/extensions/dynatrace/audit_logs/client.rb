# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/audit_logs'

module Legion
  module Extensions
    module Dynatrace
      module AuditLogs
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::AuditLogs
        end
      end
    end
  end
end
