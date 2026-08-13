---
name: data-architecture
description: Design and audit data ownership, relationships, constraints, migrations, transactions, indexes, lifecycle, and ORM usage.
---


# Data Architecture

## Mission
Turn product rules into durable data structures and lifecycle behavior while respecting the database/ORM already present.

## Principles
- Product invariants should survive UI changes.
- Database constraints protect durable integrity.
- ORM convenience does not replace schema thinking.
- Normalize around ownership/lifecycle; denormalize only for demonstrated value.
- Migrations are production changes, not just generated files.
- Indexes follow actual access patterns.
- Conceptual documentation should not hardcode one ORM.

## Workflow
1. Detect database, ORM/query layer, migration system, and conventions.
2. Derive conceptual entities from product requirements.
3. Define ownership, identity, relationships/cardinality, nullability, lifecycle, deletion.
4. Define invariants/constraints.
5. Identify transactional operations.
6. Review important access patterns and indexes.
7. Plan migrations/compatibility for existing data.
8. Coordinate types/contracts without exposing persistence as the frontend API.
9. Verify migrations and critical queries.

## Existing apps
Do not redesign a working schema just for naming aesthetics. Change shape only for product, integrity, performance, or maintainability value that justifies migration risk.

## Framework/ORM
Use Prisma/Postgres, Laravel/Eloquent, or other detected tools natively. Specialized database skills may support this architecture layer.

## Approval-worthy
Destructive migrations, key/identity changes, ownership/tenancy changes, major relationships, retention/deletion changes, irreversible backfills.

References:
- `references/data-model-review.md`
- `references/migrations.md`
- `references/transactions-and-indexes.md`
