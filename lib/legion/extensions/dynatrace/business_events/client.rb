# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/business_events'

module Legion
  module Extensions
    module Dynatrace
      module BusinessEvents
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::BusinessEvents
        end
      end
    end
  end
end
