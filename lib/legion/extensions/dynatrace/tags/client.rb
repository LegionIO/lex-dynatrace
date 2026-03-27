# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/tags'

module Legion
  module Extensions
    module Dynatrace
      module Tags
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::Tags
        end
      end
    end
  end
end
