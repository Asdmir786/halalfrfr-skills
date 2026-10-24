---
name: postgres-data-modeling
description: Design and review PostgreSQL schemas, relationships, tenant ownership, constraints, indexes, transactions, migrations, audit history, lifecycle, and Prisma or Laravel persistence. Use for greenfield data models, schema changes, performance, duplicate-prevention, and safe production migrations.
metadata:
  family: halalfrfr
  version: "4.0.0"
---


# PostgreSQL Data Modeling

Use the database to protect durable truth.

## Start From Business Concepts

List the business nouns and rules before generating tables.

For every entity define:

- identity;
- tenant/organization ownership;
- relationships;
- required and optional data;
- lifecycle states;
- real business uniqueness;
- deletion/retention behavior;
- audit/history requirements;
- common query patterns;
- concurrency risks.

Do not let an ORM schema become the first product specification.

## Relationships and Constraints

Use:

- primary keys;
- foreign keys;
- `NOT NULL` where absence is invalid;
- unique constraints for actual uniqueness;
- check constraints for simple invariants;
- exclusion/partial constraints where they fit;
- transactions and locks for multi-record invariants.

Application checks provide friendly errors. Database constraints prevent races.

For tenant-owned uniqueness, include tenant scope when the business rule is tenant-local.

## Tenant Isolation

Every tenant-owned table should have a clear ownership path. Avoid relying on a client-submitted tenant identifier.

Queries, foreign keys, composite uniqueness, and tests should make cross-tenant mistakes difficult. Consider database row-level security only when the team can configure, test, and operate it correctly; it is not a substitute for application authorization.

## Workflow State

Prefer one explicit status plus transition rules over many contradictory booleans.

Store authoritative expiry/deadline timestamps on the server for countdowns and scheduled transitions.

Use history/event tables when the product needs a trustworthy timeline, not merely `updated_at`.

## Money, Time, and Identifiers

- Store money in an exact numeric representation with an explicit currency.
- Store timestamps consistently, normally UTC, and render in the user's/venue's timezone.
- Use opaque public identifiers where sequential IDs create exposure risk.
- Do not use floating point for financial totals.

## Indexes

Design indexes from real query shapes. Consider:

- equality filters first;
- range/order requirements;
- tenant scope;
- partial indexes for active records;
- uniqueness;
- write cost and unused indexes.

Confirm performance with query plans and realistic data rather than guessing.

## Transactions and Concurrency

Identify operations that must be atomic, such as:

- creating a bill and changing session state;
- consuming quota;
- reserving inventory;
- submitting an order only once;
- moving a workflow between states.

Use appropriate transaction isolation, row locks, unique constraints, or optimistic version checks. Do not rely on frontend timing.

## Migrations

For production:

- keep migrations in source control;
- inspect generated SQL;
- avoid automatic destructive reset;
- separate schema expansion from code cutover and later cleanup when zero/low downtime matters;
- backfill in controlled batches;
- add constraints after data is valid;
- plan rollback or forward-fix;
- test against a production-like copy when risk is meaningful;
- deploy migrations in the correct order relative to API/frontend versions.

Never run a destructive migration against production because an agent command suggested it.

## Prisma and Laravel

Use the framework's migration system consistently. Do not mix `db push`-style shortcuts with production migration history without understanding drift.

Keep database-level constraints even when Prisma validation or Laravel Form Requests perform the same check.

## Review Output

For schema work report:

- entities/relationships;
- invariants and where they are enforced;
- tenant ownership;
- indexes and expected query use;
- migration/backfill sequence;
- concurrency and data-loss risks;
- tests and verification performed.
