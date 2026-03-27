# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/davis'

module Legion
  module Extensions
    module Dynatrace
      module Davis
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::Davis
        end
      end
    end
  end
end
