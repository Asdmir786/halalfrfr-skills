# Documentation Standard

Documentation is a memory/coordination tool, not a quota.

## Small work
No new docs unless a durable contract or rule changes.

## Medium feature
A concise implementation brief plus changed contracts may be enough.

## Substantial SaaS
Use the smallest useful subset:

- `docs/product/PRD.md`
- `docs/product/REQUIREMENTS.md`
- `docs/product/FLOWS.md`
- `docs/architecture/SYSTEM.md`
- `docs/architecture/FRONTEND.md`
- `docs/architecture/BACKEND.md`
- `docs/architecture/DATA-MODEL.md`
- `docs/contracts/API.md`
- `docs/contracts/INTEGRATIONS.md`
- `docs/implementation/PLAN.md`
- `docs/implementation/TEST-PLAN.md`

Combine docs when clearer. Never create empty documentation shells.

## Rebuild rule
Before deleting old presentation code, document critical product behavior and integration contracts so implementation files can be discarded without losing the knowledge needed to reproduce behavior.
