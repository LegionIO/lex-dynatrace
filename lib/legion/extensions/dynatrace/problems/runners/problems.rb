# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Problems
        module Runners
          module Problems
            def list_problems(problem_selector: nil, fields: nil, from: nil, to: nil, sort: nil,
                              page_size: nil, next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:problemSelector] = problem_selector if problem_selector
              params[:fields] = fields if fields
              params[:from] = from if from
              params[:to] = to if to
              params[:sort] = sort if sort
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get('api/v2/problems', params).body
            end

            def get_problem(problem_id:, fields: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:fields] = fields if fields
              conn.get("api/v2/problems/#{problem_id}", params).body
            end

            def close_problem(problem_id:, message:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.post("api/v2/problems/#{problem_id}/close", { message: message }).body
            end

            def list_comments(problem_id:, page_size: nil, next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get("api/v2/problems/#{problem_id}/comments", params).body
            end

            def create_comment(problem_id:, message:, context: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              payload = { message: message }
              payload[:context] = context if context
              conn.post("api/v2/problems/#{problem_id}/comments", payload).body
            end

            def update_comment(problem_id:, comment_id:, message:, context: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              payload = { message: message }
              payload[:context] = context if context
              conn.put("api/v2/problems/#{problem_id}/comments/#{comment_id}", payload).body
            end

            def delete_comment(problem_id:, comment_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.delete("api/v2/problems/#{problem_id}/comments/#{comment_id}").body
            end
          end
        end
      end
    end
  end
end
