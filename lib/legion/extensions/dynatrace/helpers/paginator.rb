# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Helpers
        module Paginator
          def paginate(method_name, result_key:, **params)
            all_results = []
            next_page_key = nil

            loop do
              params[:next_page_key] = next_page_key if next_page_key
              response = send(method_name, **params)
              items = response[result_key]
              all_results.concat(items) if items.is_a?(Array)
              next_page_key = response['nextPageKey']
              break if next_page_key.nil? || next_page_key.empty?
            end

            all_results
          end
        end
      end
    end
  end
end
