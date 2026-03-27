# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module AuditLogs
        module Runners
          module AuditLogs
            def list_audit_logs(filter: nil, from: nil, to: nil, sort: nil,
                                page_size: nil, next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:filter] = filter if filter
              params[:from] = from if from
              params[:to] = to if to
              params[:sort] = sort if sort
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get('api/v2/auditlogs', params).body
            end

            def get_audit_log(log_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/auditlogs/#{log_id}").body
            end
          end
        end
      end
    end
  end
end
