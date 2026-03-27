# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module SettingsObjects
        module Runners
          module Schemas
            def list_schemas(page_size: nil, next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get('api/v2/settings/schemas', params).body
            end

            def get_schema(schema_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/settings/schemas/#{schema_id}").body
            end
          end
        end
      end
    end
  end
end
