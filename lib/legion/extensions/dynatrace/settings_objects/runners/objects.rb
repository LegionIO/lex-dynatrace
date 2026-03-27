# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module SettingsObjects
        module Runners
          module Objects
            def list_objects(schema_ids: nil, scopes: nil, fields: nil,
                             page_size: nil, next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:schemaIds] = schema_ids if schema_ids
              params[:scopes] = scopes if scopes
              params[:fields] = fields if fields
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get('api/v2/settings/objects', params).body
            end

            def get_object(object_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/settings/objects/#{object_id}").body
            end

            def create_objects(body:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.post('api/v2/settings/objects', body).body
            end

            def update_object(object_id:, body:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.put("api/v2/settings/objects/#{object_id}", body).body
            end

            def delete_object(object_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.delete("api/v2/settings/objects/#{object_id}").body
            end
          end
        end
      end
    end
  end
end
