# frozen_string_literal: true

require_relative 'documents/runners/documents'
require_relative 'helpers/client'
require_relative 'base_client'

module Legion
  module Extensions
    module Dynatrace
      module Documents
        class Client < BaseClient
          include Runners::Documents
        end
      end
    end
  end
end
