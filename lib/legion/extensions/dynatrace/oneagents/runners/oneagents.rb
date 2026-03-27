# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Oneagents
        module Runners
          module Oneagents
            def list_oneagents(host_id: nil, os_type: nil, auto_update_setting: nil,
                               update_status: nil, version_compare_type: nil, version: nil,
                               availability_state: nil, page_size: nil, next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:hostId] = host_id if host_id
              params[:osType] = os_type if os_type
              params[:autoUpdateSetting] = auto_update_setting if auto_update_setting
              params[:updateStatus] = update_status if update_status
              params[:versionCompareType] = version_compare_type if version_compare_type
              params[:version] = version if version
              params[:availabilityState] = availability_state if availability_state
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get('api/v2/oneagents', params).body
            end
          end
        end
      end
    end
  end
end
