# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module GeographicRegions
        module Runners
          module GeographicRegions
            def list_regions(**opts)
              conn = opts[:connection] || connection(**opts)
              conn.get('api/v2/rum/geographicRegions/ipDetectionHeaders').body
            end

            def list_ip_address_mappings(page_size: nil, next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get('api/v2/rum/geographicRegions/ipAddressMappings', params).body
            end
          end
        end
      end
    end
  end
end
