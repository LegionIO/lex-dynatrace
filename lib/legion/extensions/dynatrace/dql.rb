# frozen_string_literal: true

require_relative 'dql/runners/dql'
require_relative 'helpers/client'
require_relative 'base_client'

module Legion
  module Extensions
    module Dynatrace
      module Dql
        class Client < BaseClient
          include Runners::Dql
        end
      end
    end
  end
end
