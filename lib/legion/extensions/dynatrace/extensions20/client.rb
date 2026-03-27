# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/extensions'

module Legion
  module Extensions
    module Dynatrace
      module Extensions20
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::Extensions
        end
      end
    end
  end
end
