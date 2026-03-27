# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Units
        module Runners
          module Units
            def list_units(unit_selector: nil, fields: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:unitSelector] = unit_selector if unit_selector
              params[:fields] = fields if fields
              conn.get('api/v2/units', params).body
            end

            def get_unit(unit_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/units/#{unit_id}").body
            end

            def convert_units(unit_id:, value:, target_unit:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/units/#{unit_id}/convert",
                       value: value, targetUnit: target_unit).body
            end
          end
        end
      end
    end
  end
end
