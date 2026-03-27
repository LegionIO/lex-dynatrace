# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/metrics'

module Legion
  module Extensions
    module Dynatrace
      module Metrics
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::Metrics
        end
      end
    end
  end
end
