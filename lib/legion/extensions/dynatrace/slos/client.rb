# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/slos'

module Legion
  module Extensions
    module Dynatrace
      module Slos
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::Slos
        end
      end
    end
  end
end
