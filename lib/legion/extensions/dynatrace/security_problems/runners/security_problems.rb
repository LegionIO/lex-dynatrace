# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module SecurityProblems
        module Runners
          module SecurityProblems
            def list_security_problems(security_problem_selector: nil, from: nil, to: nil, fields: nil,
                                       sort: nil, page_size: nil, next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:securityProblemSelector] = security_problem_selector if security_problem_selector
              params[:from] = from if from
              params[:to] = to if to
              params[:fields] = fields if fields
              params[:sort] = sort if sort
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get('api/v2/securityProblems', params).body
            end

            def get_security_problem(security_problem_id:, fields: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:fields] = fields if fields
              conn.get("api/v2/securityProblems/#{security_problem_id}", params).body
            end

            def mute_security_problem(security_problem_id:, reason:, comment: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              payload = { reason: reason }
              payload[:comment] = comment if comment
              conn.post("api/v2/securityProblems/#{security_problem_id}/mute", payload).body
            end

            def unmute_security_problem(security_problem_id:, reason:, comment: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              payload = { reason: reason }
              payload[:comment] = comment if comment
              conn.post("api/v2/securityProblems/#{security_problem_id}/unmute", payload).body
            end

            def list_remediations(security_problem_id:, remediation_type: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:remediationType] = remediation_type if remediation_type
              conn.get("api/v2/securityProblems/#{security_problem_id}/remediationItems", params).body
            end
          end
        end
      end
    end
  end
end
