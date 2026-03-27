# frozen_string_literal: true

require_relative 'activegate_tokens/runners/activegate_tokens'
require_relative 'helpers/client'
require_relative 'base_client'

module Legion
  module Extensions
    module Dynatrace
      module ActivegateTokens
        class Client < BaseClient
          include Runners::ActivegateTokens
        end
      end
    end
  end
end
