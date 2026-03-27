# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/units'

module Legion
  module Extensions
    module Dynatrace
      module Units
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::Units
        end
      end
    end
  end
end
