# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/geographic_regions'

module Legion
  module Extensions
    module Dynatrace
      module GeographicRegions
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::GeographicRegions
        end
      end
    end
  end
end
