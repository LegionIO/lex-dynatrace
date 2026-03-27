# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/monitors'
require_relative 'runners/locations'

module Legion
  module Extensions
    module Dynatrace
      module Synthetic
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::Monitors
          include Runners::Locations
        end
      end
    end
  end
end
