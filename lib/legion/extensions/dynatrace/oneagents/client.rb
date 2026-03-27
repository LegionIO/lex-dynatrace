# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/oneagents'

module Legion
  module Extensions
    module Dynatrace
      module Oneagents
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::Oneagents
        end
      end
    end
  end
end
