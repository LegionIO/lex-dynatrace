# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/logs'

module Legion
  module Extensions
    module Dynatrace
      module Logs
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::Logs
        end
      end
    end
  end
end
