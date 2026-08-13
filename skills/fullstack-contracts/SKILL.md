---
name: fullstack-contracts
description: Keep frontend and backend aligned through explicit API, action, and event contracts, auth expectations, errors, and state transitions.
---


# Full-Stack Contracts

## Mission
Make frontend and backend implement the same product behavior from an explicit shared contract. Own the interaction boundary, not either side's internal architecture.

## Use when
- a feature spans frontend/backend;
- API, server action, RPC, event, or webhook behavior is created/changed;
- payloads, errors, permissions, or states drift;
- a frontend is replaced while backend behavior must remain;
- public/integration contracts need audit.

## Contract contents
Capture what callers rely on: operation purpose, transport, auth/authz expectations, input/output shape, validation/normalization semantics, stable errors/status, pagination/filter/sort, idempotency/concurrency when relevant, side effects, lifecycle transitions, and compatibility/versioning when relevant.

## Workflow
1. Discover current behavior by inspecting caller and server.
2. Express semantics independently from UI components/controllers.
3. Detect mismatches: assumed fields, indistinguishable errors, frontend-only permissions, divergent validation, optional/null confusion, hidden side effects.
4. Update `docs/contracts/API.md`, `INTEGRATIONS.md`, or useful machine-readable artifacts.
5. Backend owns authoritative behavior; frontend owns user-facing handling of defined states.

## Approval-worthy changes
Breaking request/response changes, auth semantic changes, new destructive behavior, changed business meaning, removed guarantees, or externally consumed contract changes.

## Rebuild rule
Before deleting old frontend: document contracts, identify connection behavior mixed into UI, extract/reproduce it, remove presentation code only afterward, then verify every critical contract.

## Boundaries
Do not choose tables, design UI, hide authz solely in frontend, or invent generic wrappers without need.

References:
- `references/contract-template.md`
- `references/compatibility.md`
- `references/rebuild-contract-extraction.md`
