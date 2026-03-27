# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Entities
        module Runners
          module Entities
            def list_entities(entity_selector: nil, from: nil, to: nil, fields: nil, page_size: nil,
                              next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:entitySelector] = entity_selector if entity_selector
              params[:from] = from if from
              params[:to] = to if to
              params[:fields] = fields if fields
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get('api/v2/entities', params).body
            end

            def get_entity(entity_id:, from: nil, to: nil, fields: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:from] = from if from
              params[:to] = to if to
              params[:fields] = fields if fields
              conn.get("api/v2/entities/#{entity_id}", params).body
            end

            def list_entity_types(page_size: nil, next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get('api/v2/entityTypes', params).body
            end

            def get_entity_type(type:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/entityTypes/#{type}").body
            end

            def push_custom_device(body:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.post('api/v2/entities/custom', body).body
            end
          end
        end
      end
    end
  end
end
