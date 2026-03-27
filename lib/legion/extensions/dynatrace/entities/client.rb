# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/entities'

module Legion
  module Extensions
    module Dynatrace
      module Entities
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::Entities
        end
      end
    end
  end
end
