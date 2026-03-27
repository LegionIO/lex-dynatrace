# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Slos
        module Runners
          module Slos
            def list_slos(slo_selector: nil, from: nil, to: nil, page_size: nil,
                          next_page_key: nil, sort: nil, time_frame: nil,
                          demo: nil, evaluate: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:sloSelector] = slo_selector if slo_selector
              params[:from] = from if from
              params[:to] = to if to
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              params[:sort] = sort if sort
              params[:timeFrame] = time_frame if time_frame
              params[:demo] = demo unless demo.nil?
              params[:evaluate] = evaluate unless evaluate.nil?
              conn.get('api/v2/slo', params).body
            end

            def get_slo(slo_id:, from: nil, to: nil, time_frame: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:from] = from if from
              params[:to] = to if to
              params[:timeFrame] = time_frame if time_frame
              conn.get("api/v2/slo/#{slo_id}", params).body
            end

            def create_slo(slo:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.post('api/v2/slo', slo).body
            end

            def update_slo(slo_id:, slo:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.put("api/v2/slo/#{slo_id}", slo).body
            end

            def delete_slo(slo_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.delete("api/v2/slo/#{slo_id}").body
            end
          end
        end
      end
    end
  end
end
