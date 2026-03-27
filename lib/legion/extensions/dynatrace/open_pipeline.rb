# frozen_string_literal: true

require_relative 'open_pipeline/runners/open_pipeline'
require_relative 'helpers/client'
require_relative 'base_client'

module Legion
  module Extensions
    module Dynatrace
      module OpenPipeline
        class Client < BaseClient
          include Runners::OpenPipeline
        end
      end
    end
  end
end
