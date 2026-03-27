# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/network_zones'

module Legion
  module Extensions
    module Dynatrace
      module NetworkZones
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::NetworkZones
        end
      end
    end
  end
end
