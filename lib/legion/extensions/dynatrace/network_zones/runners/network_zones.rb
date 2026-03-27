# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module NetworkZones
        module Runners
          module NetworkZones
            def list_network_zones(**opts)
              conn = opts[:connection] || connection(**opts)
              conn.get('api/v2/networkZones').body
            end

            def get_network_zone(network_zone_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/networkZones/#{network_zone_id}").body
            end

            def create_network_zone(network_zone_id:, body:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.put("api/v2/networkZones/#{network_zone_id}", body).body
            end

            def update_network_zone(network_zone_id:, body:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.put("api/v2/networkZones/#{network_zone_id}", body).body
            end

            def delete_network_zone(network_zone_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.delete("api/v2/networkZones/#{network_zone_id}").body
            end
          end
        end
      end
    end
  end
end
