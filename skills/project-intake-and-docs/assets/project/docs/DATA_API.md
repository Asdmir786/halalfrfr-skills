# Data, API, Events, and Migrations

> This document owns durable data invariants and cross-boundary contracts. Exact schemas remain in migrations/ORM definitions and exact API schemas remain in the contract source.

## Data Ownership and Sources of Truth

| Concept | Authoritative source | Writer(s) | Readers | Derived/cache copies |
|---|---|---|---|---|
| TBD | TBD | TBD | TBD | TBD |

Every important state, total, timer, permission input, and entitlement should have one authoritative source.

## Core Entities

| Entity | Tenant/owner | Key relationships | Lifecycle/status | Critical invariant |
|---|---|---|---|---|
| TBD | TBD | TBD | TBD | TBD |

## Relationship Model

```text
TBD
```

Document one-to-one, one-to-many, many-to-many, ownership, and boundary relationships relevant to current work.

## Database Conventions

- identifiers: TBD
- tenant keys: TBD
- timestamps/timezones: TBD
- money/currency/precision: TBD
- nullability/defaults: TBD
- enum/status strategy: TBD
- soft deletion/retention: TBD
- audit/history: TBD
- naming: TBD

## Constraints and Concurrency

| Invariant | Application validation | Database protection | Transaction/locking/idempotency |
|---|---|---|---|
| TBD | TBD | unique/check/FK/etc. | TBD |

Use database constraints to protect durable truth; application checks provide useful errors but do not replace constraints.

## Query and Index Strategy

| Query/access pattern | Filter/order | Expected scale | Index/pagination strategy |
|---|---|---|---|
| TBD | TBD | TBD | TBD |

Create indexes from actual access patterns rather than indexing every field.

## API Style and Versioning

- protocol/style: REST / GraphQL / RPC / mixed
- base URL/versioning: TBD
- contract source: OpenAPI / schemas / generated client / TBD
- authentication transport: TBD
- compatibility policy: TBD

## Request and Response Contracts

| Operation | Actor | Request schema | Response schema | Authorization/policy | Idempotent? |
|---|---|---|---|---|---:|
| TBD | TBD | TBD | TBD | TBD | TBD |

Do not expose ORM/database models directly as public contracts.

## Error Contract

```json
{
  "code": "STABLE_MACHINE_CODE",
  "message": "Safe user-facing explanation",
  "details": {},
  "requestId": "req_..."
}
```

- field validation format: TBD
- permission/not-found behavior: TBD
- provider failure mapping: TBD
- internal detail redaction: TBD

## Pagination, Filtering, Sorting, and Search

- pagination model: TBD
- stable cursor/order: TBD
- filter syntax: TBD
- sort allowlist: TBD
- full-text/search provider: TBD
- export limits: TBD

## Workflow States and Transitions

| Aggregate/workflow | Current state | Allowed next state | Preconditions | Actor/policy | Side effects |
|---|---|---|---|---|---|
| TBD | TBD | TBD | TBD | TBD | TBD |

The backend validates transitions; clients display them but do not define legality.

## Events, Jobs, and Webhooks

| Event/job/webhook | Producer | Payload/version | Idempotency identity | Consumer | Retry/dead-letter |
|---|---|---|---|---|---|
| TBD | TBD | TBD | TBD | TBD | TBD |

- webhook signature/raw-body rules: TBD
- replay window: TBD
- outbox/event consistency if needed: TBD

## File and Object Data

- accepted types/sizes: TBD
- upload path and authorization: TBD
- storage keys/tenant isolation: TBD
- processing/scanning: TBD
- download authorization and expiry: TBD
- retention/deletion: TBD

## Migration Workflow

- development migration command: TBD
- production application command: TBD
- schema expansion/backfill/cleanup strategy: TBD
- zero/low-downtime requirements: TBD
- destructive-change approval: TBD
- data validation/reconciliation: TBD
- rollback or forward-fix: TBD
- backup/restore prerequisite: TBD

## Seed, Fixture, and Test Data

- local seed: TBD
- test factories/fixtures: TBD
- synthetic data policy: TBD
- production-data use in non-production: prohibited / approved exception

## Open Data and API Decisions

- TBD
