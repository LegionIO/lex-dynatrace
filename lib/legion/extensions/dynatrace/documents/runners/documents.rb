# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Documents
        module Runners
          module Documents
            def list_documents(filter: nil, sort: nil, page_size: nil, next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:filter] = filter if filter
              params[:sort] = sort if sort
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get('api/v2/documents', params).body
            end

            def get_document(document_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/documents/#{document_id}").body
            end

            def create_document(document:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.post('api/v2/documents', document).body
            end

            def update_document(document_id:, document:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.put("api/v2/documents/#{document_id}", document).body
            end

            def delete_document(document_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.delete("api/v2/documents/#{document_id}").body
            end
          end
        end
      end
    end
  end
end
