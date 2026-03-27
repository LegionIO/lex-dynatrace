# Changelog

## [0.1.0] - 2026-03-27

### Added
- Initial release with 24 sub-modules covering Dynatrace Environment API v2
- Metrics: list descriptors, get descriptor, query data points, ingest custom metrics
- Entities: list/get entities, list/get entity types
- Problems: list/get/close problems, list/create comments
- Events: list/get events, ingest custom events
- Logs: search and aggregate log data
- Audit Logs: list/get audit log entries
- ActiveGates: list/get ActiveGate instances
- Extensions 2.0: full extension lifecycle, environment config, monitoring configurations
- SLOs: CRUD for service level objectives
- Synthetic: monitor CRUD, locations, execution reports
- Security Problems: list/get/mute/unmute, remediations
- Settings Objects: CRUD for settings objects and schemas
- Network Zones: CRUD for network zones
- Tags: get/add/delete entity tags
- API Tokens: CRUD, lookup
- Releases: list/get release information
- Attacks: list/get detected attacks
- Business Events: ingest single and batch CloudEvents
- Credentials: credential vault CRUD
- Deployment: agent installer metadata, connection info, versions
- Units: list/get/convert measurement units
- Geographic Regions: IP detection headers, address mappings
- OneAgents: list OneAgent instances with filtering
- Davis: AI root cause analysis (evidence, impact, root cause entity)
- Unified top-level Client including all runners + pagination helper
- Standalone Client class per sub-module (lex-cloudflare multi-module pattern)
- Shared CI/release workflow via LegionIO/.github
- 93 specs with WebMock stubs
