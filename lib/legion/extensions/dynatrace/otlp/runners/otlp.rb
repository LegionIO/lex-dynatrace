# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Otlp
        module Runners
          module Otlp
            def ingest_traces(traces:, **)
              conn = otlp_connection(**)
              conn.post('api/v2/otlp/v1/traces', traces).body
            end

            def ingest_otlp_metrics(metrics:, **)
              conn = otlp_connection(**)
              conn.post('api/v2/otlp/v1/metrics', metrics).body
            end

            def ingest_otlp_logs(logs:, **)
              conn = otlp_connection(**)
              conn.post('api/v2/otlp/v1/logs', logs).body
            end

            private

            def otlp_connection(**opts)
              base = opts[:environment_url] || @opts&.dig(:environment_url)
              token = opts[:api_token] || @opts&.dig(:api_token)
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
end
