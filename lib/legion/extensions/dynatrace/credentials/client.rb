# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/credentials'

module Legion
  module Extensions
    module Dynatrace
      module Credentials
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::Credentials
        end
      end
    end
  end
end
