# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Tokens
        module Runners
          module Tokens
            def list_tokens(page_size: nil, next_page_key: nil, sort: nil, fields: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              params[:sort] = sort if sort
              params[:fields] = fields if fields
              conn.get('api/v2/apiTokens', params).body
            end

            def get_token(token_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/apiTokens/#{token_id}").body
            end

            def create_token(name:, scopes:, expiration_date: nil, personal_access_token: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              payload = { name: name, scopes: scopes }
              payload[:expirationDate] = expiration_date if expiration_date
              payload[:personalAccessToken] = personal_access_token unless personal_access_token.nil?
              conn.post('api/v2/apiTokens', payload).body
            end

            def update_token(token_id:, name: nil, enabled: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              payload = {}
              payload[:name] = name if name
              payload[:enabled] = enabled unless enabled.nil?
              conn.put("api/v2/apiTokens/#{token_id}", payload).body
            end

            def delete_token(token_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.delete("api/v2/apiTokens/#{token_id}").body
            end

            def lookup_token(token:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.post('api/v2/apiTokens/lookup', { token: token }).body
            end
          end
        end
      end
    end
  end
end
