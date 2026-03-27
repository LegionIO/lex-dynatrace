# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      class BaseClient
        include Helpers::Client

        attr_reader :opts

        def initialize(environment_url:, api_token: nil, **extra)
          @opts = { environment_url: environment_url, api_token: api_token, **extra }.compact
        end

        def settings
          { options: @opts }
        end

        def connection(**override)
          super(**@opts, **override)
        end
      end
    end
  end
end
