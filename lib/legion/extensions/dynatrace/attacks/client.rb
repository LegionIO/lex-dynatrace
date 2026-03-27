# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/attacks'

module Legion
  module Extensions
    module Dynatrace
      module Attacks
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::Attacks
        end
      end
    end
  end
end
