# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Logs
        module Runners
          module Logs
            def search_logs(query: nil, from: nil, to: nil, limit: nil, sort: nil,
                            next_slice_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:query] = query if query
              params[:from] = from if from
              params[:to] = to if to
              params[:limit] = limit if limit
              params[:sort] = sort if sort
              params[:nextSliceKey] = next_slice_key if next_slice_key
              conn.get('api/v2/logs/search', params).body
            end

            def aggregate_logs(query: nil, time_buckets: nil, group_by: nil, from: nil, to: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:query] = query if query
              params[:timeBuckets] = time_buckets if time_buckets
              params[:groupBy] = group_by if group_by
              params[:from] = from if from
              params[:to] = to if to
              conn.get('api/v2/logs/aggregate', params).body
            end
          end
        end
      end
    end
  end
end
