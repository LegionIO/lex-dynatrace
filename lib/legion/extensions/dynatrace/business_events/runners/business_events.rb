# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module BusinessEvents
        module Runners
          module BusinessEvents
            def ingest_business_event(data:, **opts)
              env_url = opts[:environment_url] || self.opts[:environment_url]
              token = opts[:api_token] || self.opts[:api_token]
              json_conn = Faraday.new(url: env_url) do |f|
                f.headers['Authorization'] = "Api-Token #{token}" if token
                f.headers['Content-Type'] = 'application/cloudevents+json'
                f.response :json
                f.adapter Faraday.default_adapter
              end
              json_conn.post('api/v2/bizevents/ingest', data.to_json).body
            end

            def ingest_business_events_batch(events:, **opts)
              env_url = opts[:environment_url] || self.opts[:environment_url]
              token = opts[:api_token] || self.opts[:api_token]
              batch_conn = Faraday.new(url: env_url) do |f|
                f.headers['Authorization'] = "Api-Token #{token}" if token
                f.headers['Content-Type'] = 'application/cloudevents-batch+json'
                f.response :json
                f.adapter Faraday.default_adapter
              end
              batch_conn.post('api/v2/bizevents/ingest', events.to_json).body
            end
          end
        end
      end
    end
  end
end
