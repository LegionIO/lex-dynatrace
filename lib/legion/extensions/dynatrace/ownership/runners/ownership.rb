# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Ownership
        module Runners
          module Ownership
            def list_teams(page_size: nil, next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get('api/v2/ownership/teams', params).body
            end

            def get_team(team_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/ownership/teams/#{team_id}").body
            end

            def create_team(team:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.post('api/v2/ownership/teams', team).body
            end

            def update_team(team_id:, team:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.put("api/v2/ownership/teams/#{team_id}", team).body
            end

            def delete_team(team_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.delete("api/v2/ownership/teams/#{team_id}").body
            end

            def validate_ownership(entity_selector:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get('api/v2/ownership/validate', { entitySelector: entity_selector }).body
            end
          end
        end
      end
    end
  end
end
