# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module ActivegateTokens
        module Runners
          module ActivegateTokens
            def list_activegate_tokens(page_size: nil, next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get('api/v2/activeGateTokens', params).body
            end

            def get_activegate_token(token_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/activeGateTokens/#{token_id}").body
            end

            def create_activegate_token(name:, expiration_date: nil, seed_token: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              payload = { name: name }
              payload[:expirationDate] = expiration_date if expiration_date
              payload[:seedToken] = seed_token unless seed_token.nil?
              conn.post('api/v2/activeGateTokens', payload).body
            end

            def revoke_activegate_token(token_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.delete("api/v2/activeGateTokens/#{token_id}").body
            end
          end
        end
      end
    end
  end
end
