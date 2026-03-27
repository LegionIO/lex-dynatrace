# frozen_string_literal: true

require_relative 'otlp/runners/otlp'
require_relative 'helpers/client'
require_relative 'base_client'

module Legion
  module Extensions
    module Dynatrace
      module Otlp
        class Client < BaseClient
          include Runners::Otlp
        end
      end
    end
  end
end
