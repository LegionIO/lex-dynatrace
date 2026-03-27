# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module ActiveGates
        module Runners
          module ActiveGates
            def list_active_gates(hostname: nil, os_type: nil, network_zone: nil, update_status: nil,
                                  version_compare_type: nil, version: nil, group: nil,
                                  page_size: nil, next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:hostname] = hostname if hostname
              params[:osType] = os_type if os_type
              params[:networkZone] = network_zone if network_zone
              params[:updateStatus] = update_status if update_status
              params[:versionCompareType] = version_compare_type if version_compare_type
              params[:version] = version if version
              params[:group] = group if group
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get('api/v2/activeGates', params).body
            end

            def get_active_gate(ag_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/activeGates/#{ag_id}").body
            end
          end
        end
      end
    end
  end
end
