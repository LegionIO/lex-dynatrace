# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Dql
        module Runners
          module Dql
            def execute_query(query:, default_timeframe_start: nil, default_timeframe_end: nil,
                              timezone: nil, locale: nil, max_result_records: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              payload = { query: query }
              payload[:defaultTimeframeStart] = default_timeframe_start if default_timeframe_start
              payload[:defaultTimeframeEnd] = default_timeframe_end if default_timeframe_end
              payload[:timezone] = timezone if timezone
              payload[:locale] = locale if locale
              payload[:maxResultRecords] = max_result_records if max_result_records
              conn.post('platform/storage/query/v1/query:execute', payload).body
            end
          end
        end
      end
    end
  end
end
