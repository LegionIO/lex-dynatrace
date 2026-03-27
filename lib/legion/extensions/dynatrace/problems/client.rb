# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/problems'

module Legion
  module Extensions
    module Dynatrace
      module Problems
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::Problems
        end
      end
    end
  end
end
