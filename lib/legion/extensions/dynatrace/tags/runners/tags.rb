# frozen_string_literal: true

require 'cgi'

module Legion
  module Extensions
    module Dynatrace
      module Tags
        module Runners
          module Tags
            def get_tags(entity_selector:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get('api/v2/tags', entitySelector: entity_selector).body
            end

            def add_tags(entity_selector:, tags:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.post("api/v2/tags?entitySelector=#{CGI.escape(entity_selector)}",
                        { tags: tags }).body
            end

            def delete_tag(key:, entity_selector:, value: nil, delete_all_with_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = { entitySelector: entity_selector }
              params[:value] = value if value
              params[:deleteAllWithKey] = delete_all_with_key unless delete_all_with_key.nil?
              conn.delete("api/v2/tags/#{key}") { |req| req.params = params }.body
            end
          end
        end
      end
    end
  end
end
