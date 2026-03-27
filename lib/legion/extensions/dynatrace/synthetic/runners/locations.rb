# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Synthetic
        module Runners
          module Locations
            def list_locations(location_type: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:locationType] = location_type if location_type
              conn.get('api/v2/synthetic/locations', params).body
            end

            def get_location(location_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/synthetic/locations/#{location_id}").body
            end
          end
        end
      end
    end
  end
end
