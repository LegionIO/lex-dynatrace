# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/releases'

module Legion
  module Extensions
    module Dynatrace
      module Releases
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::Releases
        end
      end
    end
  end
end
