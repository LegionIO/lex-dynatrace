# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/events'

module Legion
  module Extensions
    module Dynatrace
      module Events
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::Events
        end
      end
    end
  end
end
