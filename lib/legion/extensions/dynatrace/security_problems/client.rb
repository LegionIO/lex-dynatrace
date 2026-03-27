# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/security_problems'

module Legion
  module Extensions
    module Dynatrace
      module SecurityProblems
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::SecurityProblems
        end
      end
    end
  end
end
