# frozen_string_literal: true

require_relative 'hub/runners/hub'
require_relative 'helpers/client'
require_relative 'base_client'

module Legion
  module Extensions
    module Dynatrace
      module Hub
        class Client < BaseClient
          include Runners::Hub
        end
      end
    end
  end
end
