# frozen_string_literal: true

require_relative '../helpers/client'
require_relative '../base_client'
require_relative 'runners/objects'
require_relative 'runners/schemas'

module Legion
  module Extensions
    module Dynatrace
      module SettingsObjects
        class Client < Legion::Extensions::Dynatrace::BaseClient
          include Runners::Objects
          include Runners::Schemas
        end
      end
    end
  end
end
