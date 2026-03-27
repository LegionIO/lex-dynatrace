# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Extensions20
        module Runners
          module Extensions
            def list_extensions(page_size: nil, next_page_key: nil, name: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              params[:name] = name if name
              conn.get('api/v2/extensions', params).body
            end

            def get_extension(extension_name:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/extensions/#{extension_name}").body
            end

            def delete_extension(extension_name:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.delete("api/v2/extensions/#{extension_name}").body
            end

            def get_extension_version(extension_name:, extension_version:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/extensions/#{extension_name}/#{extension_version}").body
            end

            def delete_extension_version(extension_name:, extension_version:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.delete("api/v2/extensions/#{extension_name}/#{extension_version}").body
            end

            def get_environment_config(extension_name:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/extensions/#{extension_name}/environmentConfiguration").body
            end

            def update_environment_config(extension_name:, version:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.put("api/v2/extensions/#{extension_name}/environmentConfiguration",
                       { version: version }).body
            end

            def delete_environment_config(extension_name:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.delete("api/v2/extensions/#{extension_name}/environmentConfiguration").body
            end

            def list_monitoring_configs(extension_name:, page_size: nil, next_page_key: nil, **opts)
              conn = opts[:connection] || connection(**opts)
              params = {}
              params[:pageSize] = page_size if page_size
              params[:nextPageKey] = next_page_key if next_page_key
              conn.get("api/v2/extensions/#{extension_name}/monitoringConfigurations", params).body
            end

            def get_monitoring_config(extension_name:, configuration_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/extensions/#{extension_name}/monitoringConfigurations/#{configuration_id}").body
            end

            def create_monitoring_config(extension_name:, config:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.post("api/v2/extensions/#{extension_name}/monitoringConfigurations", config).body
            end

            def update_monitoring_config(extension_name:, configuration_id:, config:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.put("api/v2/extensions/#{extension_name}/monitoringConfigurations/#{configuration_id}",
                       config).body
            end

            def delete_monitoring_config(extension_name:, configuration_id:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.delete("api/v2/extensions/#{extension_name}/monitoringConfigurations/#{configuration_id}").body
            end
          end
        end
      end
    end
  end
end
