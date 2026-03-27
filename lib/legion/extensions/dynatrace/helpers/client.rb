# frozen_string_literal: true

require 'faraday'

module Legion
  module Extensions
    module Dynatrace
      module Helpers
        module Client
          def connection(environment_url: nil, api_token: nil, **_opts)
            base = environment_url || settings.dig(:transport, :settings, :'lex-dynatrace', :environment_url)
            token = api_token || settings.dig(:transport, :settings, :'lex-dynatrace', :api_token)
            Faraday.new(url: base) do |f|
              f.request :json
              f.response :json
              f.headers['Authorization'] = "Api-Token #{token}" if token
              f.adapter Faraday.default_adapter
            end
          end
        end
      end
    end
  end
end
