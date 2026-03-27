# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Events
        module Runners
          module Events
            def list_events(event_selector: nil, from: nil, to: nil, page_size: nil,
                            next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:eventSelector] = event_selector if event_selector
              params[:from] = from if from
              params[:to] = to if to
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get('api/v2/events', params).body
            end

            def get_event(event_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/events/#{event_id}").body
            end

            def ingest_event(event_type:, title:, entity_selector: nil, properties: nil,
                             start_time: nil, end_time: nil, timeout: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              payload = { eventType: event_type, title: title }
              payload[:entitySelector] = entity_selector if entity_selector
              payload[:properties] = properties if properties
              payload[:startTime] = start_time if start_time
              payload[:endTime] = end_time if end_time
              payload[:timeout] = timeout if timeout
              conn.post('api/v2/events/ingest', payload).body
            end
          end
        end
      end
    end
  end
end
