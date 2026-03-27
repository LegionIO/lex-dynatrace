# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/deployment'

module Legion
  module Extensions
    module Dynatrace
      module Deployment
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::Deployment
        end
      end
    end
  end
end
