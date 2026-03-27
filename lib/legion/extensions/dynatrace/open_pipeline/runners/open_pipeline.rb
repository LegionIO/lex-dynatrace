# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module OpenPipeline
        module Runners
          module OpenPipeline
            def list_pipelines(**opts)
              conn = opts[:connection] || connection(**opts)
              conn.get('api/v2/openpipeline/configurations').body
            end

            def get_pipeline(pipeline_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/openpipeline/configurations/#{pipeline_id}").body
            end

            def update_pipeline(pipeline_id:, config:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.put("api/v2/openpipeline/configurations/#{pipeline_id}", config).body
            end
          end
        end
      end
    end
  end
end
