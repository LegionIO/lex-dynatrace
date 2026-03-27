# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Attacks
        module Runners
          module Attacks
            def list_attacks(attack_selector: nil, from: nil, to: nil, fields: nil, sort: nil,
                             page_size: nil, next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:attackSelector] = attack_selector if attack_selector
              params[:from] = from if from
              params[:to] = to if to
              params[:fields] = fields if fields
              params[:sort] = sort if sort
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get('api/v2/attacks', params).body
            end

            def get_attack(attack_id:, fields: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:fields] = fields if fields
              conn.get("api/v2/attacks/#{attack_id}", params).body
            end
          end
        end
      end
    end
  end
end
