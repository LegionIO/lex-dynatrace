# frozen_string_literal: true

module Legion
  module Extensions
    module Dynatrace
      module Deployment
        module Runners
          module Deployment
            def get_agent_installer_metadata(os_type:, installer_type:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/deployment/installer/agent/#{os_type}/#{installer_type}/latest/metainfo").body
            end

            def get_agent_installer_connection_info(**opts)
              conn = opts[:connection] || connection(**opts)
              conn.get('api/v2/deployment/installer/agent/connectioninfo').body
            end

            def get_agent_versions(os_type:, installer_type:, **opts)
              conn = opts[:connection] || connection(**opts)
              conn.get("api/v2/deployment/installer/agent/versions/#{os_type}/#{installer_type}").body
            end

            def get_activegate_installer_connection_info(**opts)
              conn = opts[:connection] || connection(**opts)
              conn.get('api/v2/deployment/installer/gateway/connectioninfo').body
            end
          end
        end
      end
    end
  end
end
