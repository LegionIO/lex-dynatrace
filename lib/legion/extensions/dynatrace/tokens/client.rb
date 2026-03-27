# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/tokens'

module Legion
  module Extensions
    module Dynatrace
      module Tokens
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::Tokens
        end
      end
    end
  end
end
