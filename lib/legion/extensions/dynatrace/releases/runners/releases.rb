# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Releases
        module Runners
          module Releases
            def list_releases(release_selector: nil, from: nil, to: nil, sort: nil,
                              page_size: nil, next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:releaseSelector] = release_selector if release_selector
              params[:from] = from if from
              params[:to] = to if to
              params[:sort] = sort if sort
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get('api/v2/releases', params).body
            end

            def get_release(release_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/releases/#{release_id}").body
            end
          end
        end
      end
    end
  end
end
