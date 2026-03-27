# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Davis
        module Runners
          module Davis
            def get_davis_analysis(problem_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/problems/#{problem_id}",
                       fields: '+evidenceDetails,+impactAnalysis,+rootCauseEntity').body
            end
          end
        end
      end
    end
  end
end
