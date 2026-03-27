# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Hub
        module Runners
          module Hub
            def list_hub_items(page_size: nil, next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get('api/v2/hub/items', params).body
            end

            def get_hub_item(item_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/hub/items/#{item_id}").body
            end
          end
        end
      end
    end
  end
end
