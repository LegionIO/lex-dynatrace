# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/active_gates'

module Legion
  module Extensions
    module Dynatrace
      module ActiveGates
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::ActiveGates
        end
      end
    end
  end
end
