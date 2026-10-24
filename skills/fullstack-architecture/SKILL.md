---
name: fullstack-architecture
description: Design or review production application architecture across Next.js/React frontends, separate NestJS or Laravel APIs, PostgreSQL, queues, storage, integrations, and deployment. Choose the simplest viable topology, define module and source-of-truth boundaries, and support Vercel frontend plus server-hosted backend.
metadata:
  family: halalfrfr
  version: "4.0.0"
---


# Full-Stack Architecture

## Native Planning

For greenfield, broad, risky, cross-layer, or materially ambiguous work, use the host application's native Plan Mode before editing. Let the native planner inspect evidence, ask only material clarifications, and produce a reviewable plan. Do not replace it with a separate scripted questionnaire. For a focused, reversible task with sufficient context, proceed directly after inspection.


Choose architecture to reduce coupling and operational risk, not to look advanced.

## Default Principle

Start with a modular monolith unless independent deployment, security isolation, scaling, regulatory boundaries, or multiple teams create a real reason for services.

One deployable backend can still contain clear modules, contracts, jobs, and adapters.

## Supported Shapes

### Next.js full-stack

Use for smaller products when one deployment, one team, and the framework's server capabilities meet the product and operational requirements.

Keep business logic in testable domain/application modules rather than route handlers, pages, or server actions.

### Next.js frontend plus NestJS API

Use when the product benefits from a TypeScript backend, explicit modules, background work, integrations, real-time connections, or independent backend deployment.

### Next.js frontend plus Laravel API

Use when Laravel/PHP is preferred, an existing Laravel estate exists, or Laravel's ecosystem and operational model fit the team/product.

### Existing hybrid

Preserve a working topology unless migration has a clear benefit and approved cost. Improve contracts and boundaries before rewriting.

## Vercel Frontend Plus Separate Server Backend

This is a valid production topology. Explicitly design:

- public API base URLs per environment;
- same-site versus cross-site authentication;
- CORS allowlists;
- cookies, CSRF, token storage, and refresh behavior;
- TLS and reverse proxy configuration;
- request timeouts and retries;
- upload path and size limits;
- webhook endpoints and signature verification;
- WebSocket/SSE behavior if required;
- API health checks;
- logs and request correlation across platforms;
- deployment and migration order;
- rollback when frontend and backend versions differ.

Prefer a stable API domain such as `api.example.com` and explicitly test preview/staging origins.

## Context and Module Boundaries

Model the product as business modules, for example:

- identity and access;
- organizations and memberships;
- billing and entitlements;
- orders;
- notifications;
- reports;
- integrations.

A module should own its rules and persistence access. Cross-module interaction should use explicit application interfaces, events, or carefully defined shared data, not arbitrary imports into internal files.

## Source of Truth

For every important value identify one authoritative owner:

- authenticated identity;
- tenant context;
- entitlement;
- workflow state;
- payment state;
- countdown or expiry time;
- generated totals;
- notification delivery state.

The frontend may cache or display server state, but must not independently invent business truth.

## Contracts

Separate:

- UI view models;
- API request/response contracts;
- domain models;
- database models;
- provider payloads.

Do not expose ORM records directly as public API contracts.

Use OpenAPI or an equivalent contract source to generate or verify a typed TypeScript client when frontend and backend are separate.

Route detailed work to `api-contracts`.

## Sync Versus Async

Use synchronous requests when the user needs an immediate result and the operation is fast/reliable.

Use jobs/events for:

- email and messaging;
- report generation;
- large imports/exports;
- provider retries;
- media processing;
- delayed actions;
- webhook fan-out.

Define idempotency, retry limit, dead-letter/failure handling, and user-visible status.

## Shared Code

Share stable contracts and design primitives. Do not create a `shared` dumping ground containing business internals from every module.

In a TypeScript monorepo, packages may include:

```text
apps/web
apps/api
apps/worker
packages/ui
packages/api-client
packages/config
packages/test-utils
```

A Laravel API can live in the same repository or a separate repository. Choose based on deployment ownership and release coordination, not language purity.

## Architecture Output

Update `docs/ARCHITECTURE.md` with:

- context diagram;
- deployment topology;
- modules and ownership;
- data and contract boundaries;
- auth/tenancy flow;
- jobs and integrations;
- failure modes;
- observability;
- migration/rollback considerations.

For meaningful choices, record an ADR. Do not write an ADR for routine implementation details.
