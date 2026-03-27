# lex-dynatrace

Legion Extension for the [Dynatrace Environment API v2](https://docs.dynatrace.com/docs/dynatrace-api/environment-api). Multi-module monolith covering 24 API areas with standalone clients.

## Installation

```ruby
gem 'lex-dynatrace'
```

## Authentication

All sub-modules authenticate via `Api-Token` header. Generate a token in **Dynatrace > Access tokens** with the scopes you need.

## Usage

Each sub-module has its own `Client` class that can be used standalone (no Legion runtime required):

```ruby
require 'legion/extensions/dynatrace'

# Metrics
metrics = Legion::Extensions::Dynatrace::Metrics::Client.new(
  environment_url: 'https://abc12345.live.dynatrace.com',
  api_token: 'dt0c01.xxxx'
)
metrics.query(metric_selector: 'builtin:host.cpu.usage', from: 'now-1h')
metrics.list_descriptors
metrics.ingest(lines: ['custom.metric 42'])

# Problems
problems = Legion::Extensions::Dynatrace::Problems::Client.new(
  environment_url: 'https://abc12345.live.dynatrace.com',
  api_token: 'dt0c01.xxxx'
)
problems.list_problems(from: 'now-24h')
problems.close_problem(problem_id: 'P-123', message: 'resolved')

# Entities
entities = Legion::Extensions::Dynatrace::Entities::Client.new(
  environment_url: 'https://abc12345.live.dynatrace.com',
  api_token: 'dt0c01.xxxx'
)
entities.list_entities(entity_selector: 'type(HOST)')
entities.get_entity(entity_id: 'HOST-ABC123')
```

## Sub-Modules

| Module | API Path | Methods |
|--------|----------|---------|
| **Metrics** | `/api/v2/metrics` | `list_descriptors`, `get_descriptor`, `query`, `ingest` |
| **Entities** | `/api/v2/entities` | `list_entities`, `get_entity`, `list_entity_types`, `get_entity_type` |
| **Problems** | `/api/v2/problems` | `list_problems`, `get_problem`, `close_problem`, `list_comments`, `create_comment` |
| **Events** | `/api/v2/events` | `list_events`, `get_event`, `ingest_event` |
| **Logs** | `/api/v2/logs` | `search_logs`, `aggregate_logs` |
| **AuditLogs** | `/api/v2/auditlogs` | `list_audit_logs`, `get_audit_log` |
| **ActiveGates** | `/api/v2/activeGates` | `list_active_gates`, `get_active_gate` |
| **Extensions20** | `/api/v2/extensions` | `list_extensions`, `get_extension`, `delete_extension`, `get_extension_version`, `delete_extension_version`, `get_environment_config`, `update_environment_config`, `delete_environment_config`, `list_monitoring_configs`, `get_monitoring_config`, `create_monitoring_config`, `update_monitoring_config`, `delete_monitoring_config` |
| **Slos** | `/api/v2/slo` | `list_slos`, `get_slo`, `create_slo`, `update_slo`, `delete_slo` |
| **Synthetic** | `/api/v2/synthetic` | `list_monitors`, `get_monitor`, `create_monitor`, `update_monitor`, `delete_monitor`, `get_execution`, `list_locations`, `get_location` |
| **SecurityProblems** | `/api/v2/securityProblems` | `list_security_problems`, `get_security_problem`, `mute_security_problem`, `unmute_security_problem`, `list_remediations` |
| **SettingsObjects** | `/api/v2/settings` | `list_objects`, `get_object`, `create_objects`, `update_object`, `delete_object`, `list_schemas`, `get_schema` |
| **NetworkZones** | `/api/v2/networkZones` | `list_network_zones`, `get_network_zone`, `create_network_zone`, `update_network_zone`, `delete_network_zone` |
| **Tags** | `/api/v2/tags` | `get_tags`, `add_tags`, `delete_tag` |
| **Tokens** | `/api/v2/apiTokens` | `list_tokens`, `get_token`, `create_token`, `update_token`, `delete_token`, `lookup_token` |
| **Releases** | `/api/v2/releases` | `list_releases`, `get_release` |
| **Attacks** | `/api/v2/attacks` | `list_attacks`, `get_attack` |
| **BusinessEvents** | `/api/v2/bizevents` | `ingest_business_event`, `ingest_business_events_batch` |
| **Credentials** | `/api/v2/credentials` | `list_credentials`, `get_credential`, `create_credential`, `update_credential`, `delete_credential` |
| **Deployment** | `/api/v2/deployment` | `get_agent_installer_metadata`, `get_agent_installer_connection_info`, `get_agent_versions`, `get_activegate_installer_connection_info` |
| **Units** | `/api/v2/units` | `list_units`, `get_unit`, `convert_units` |
| **GeographicRegions** | `/api/v2/rum/geographicRegions` | `list_regions`, `list_ip_address_mappings` |
| **Oneagents** | `/api/v2/oneagents` | `list_oneagents` |
| **Davis** | `/api/v2/problems` | `get_davis_analysis` (evidence, impact, root cause) |

### Unified Client

Use `Legion::Extensions::Dynatrace::Client` to access all runners from a single instance:

```ruby
dt = Legion::Extensions::Dynatrace::Client.new(
  environment_url: 'https://abc12345.live.dynatrace.com',
  api_token: 'dt0c01.xxxx'
)
dt.list_problems(from: 'now-1h')
dt.query(metric_selector: 'builtin:host.cpu.usage')
dt.list_entities(entity_selector: 'type(SERVICE)')
```

### Pagination Helper

The unified client includes a `paginate` helper for auto-paging:

```ruby
all_entities = dt.paginate(:list_entities, result_key: 'entities',
                           entity_selector: 'type(HOST)')
```

## Legion Settings

When running inside the Legion framework, credentials resolve from settings:

```json
{
  "lex-dynatrace": {
    "environment_url": "https://abc12345.live.dynatrace.com",
    "api_token": "vault://secret/dynatrace#api_token"
  }
}
```

## Development

```bash
bundle install
bundle exec rspec       # 93 specs
bundle exec rubocop     # 0 offenses
```

## License

MIT
