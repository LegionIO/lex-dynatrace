# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Synthetic
        module Runners
          module Monitors
            def list_monitors(page_size: nil, next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get('api/v2/synthetic/monitors', params).body
            end

            def get_monitor(monitor_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/synthetic/monitors/#{monitor_id}").body
            end

            def create_monitor(monitor:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.post('api/v2/synthetic/monitors', monitor).body
            end

            def update_monitor(monitor_id:, monitor:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.put("api/v2/synthetic/monitors/#{monitor_id}", monitor).body
            end

            def delete_monitor(monitor_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.delete("api/v2/synthetic/monitors/#{monitor_id}").body
            end

            def get_execution(execution_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/synthetic/executions/#{execution_id}/fullReport").body
            end

            def trigger_on_demand(body:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.post('api/v2/synthetic/executions', body).body
            end
          end
        end
      end
    end
  end
end
