# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Metrics
        module Runners
          module Metrics
            def list_descriptors(page_size: nil, next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get('api/v2/metrics', params).body
            end

            def get_descriptor(metric_key:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/metrics/#{metric_key}").body
            end

            def query(metric_selector:, resolution: nil, from: nil, to: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = { metricSelector: metric_selector }
              params[:resolution] = resolution if resolution
              params[:from] = from if from
              params[:to] = to if to
              conn.get('api/v2/metrics/query', params).body
            end

            def ingest(lines:, **opts)
              env_url = opts[:environment_url] || self.opts[:environment_url]
              token = opts[:api_token] || self.opts[:api_token]
              plain_conn = Faraday.new(url: env_url) do |f|
                f.headers['Authorization'] = "Api-Token #{token}" if token
                f.headers['Content-Type'] = 'text/plain; charset=utf-8'
                f.response :json
                f.adapter Faraday.default_adapter
              end
              body = lines.is_a?(Array) ? lines.join("\n") : lines
              plain_conn.post('api/v2/metrics/ingest', body).body
            end
          end
        end
      end
    end
  end
end
