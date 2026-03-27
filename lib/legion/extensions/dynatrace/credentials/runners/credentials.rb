# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Credentials
        module Runners
          module Credentials
            def list_credentials(name: nil, type: nil, scope: nil,
                                 page_size: nil, next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:name] = name if name
              params[:type] = type if type
              params[:scope] = scope if scope
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get('api/v2/credentials', params).body
            end

            def get_credential(credential_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/credentials/#{credential_id}").body
            end

            def create_credential(credential:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.post('api/v2/credentials', credential).body
            end

            def update_credential(credential_id:, credential:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.put("api/v2/credentials/#{credential_id}", credential).body
            end

            def delete_credential(credential_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.delete("api/v2/credentials/#{credential_id}").body
            end
          end
        end
      end
    end
  end
end
