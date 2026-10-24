---
name: testing-release-quality
description: Define and enforce production verification for frontend, backend, API, database, auth, security, accessibility, performance, migrations, and releases. Select the smallest effective automated tests, inspect rendered UI, run real commands, and never claim success without evidence.
metadata:
  family: halalfrfr
  version: "4.0.0"
---


# Testing and Release Quality

Testing exists to prove important behavior and protect future change, not to maximize test count.

## Risk-Based Test Selection

### Unit tests

Use for pure calculations, validation helpers, state transitions, policies, formatters, and other deterministic logic.

### Integration tests

Use for database constraints, transactions, repositories, authorization, modules/services, queue behavior, provider adapters, and API behavior with real framework boundaries.

### Contract tests

Use for request/response schemas, generated clients, errors, webhooks, and compatibility between independently deployed frontend and backend.

### End-to-end tests

Use for critical user journeys and cross-layer behavior. Keep them focused on high-value flows rather than duplicating every unit case.

### Visual tests

Use rendered screenshots and visual regression for design-system components, key routes, and high-risk responsive layouts. Inspect ordinary laptop height, not only large desktop width.

## Mandatory Negative Tests

For protected SaaS behavior include cases such as:

- unauthenticated;
- unauthorized role;
- wrong tenant or branch;
- missing entitlement;
- invalid workflow transition;
- duplicate/replayed request;
- provider failure;
- partial data or network failure;
- expired session or link.

## Frontend State Matrix

Verify where relevant:

- default;
- loading/skeleton;
- empty;
- error and recovery;
- partial/stale;
- disabled/pending;
- permission denied;
- plan unavailable;
- long labels and content;
- large data;
- reduced motion;
- keyboard and visible focus;
- mobile, tablet, laptop, and desktop.

## Verification Order

Use repository commands. A normal order may be:

1. formatting/lint;
2. type checking/static analysis;
3. targeted unit/integration tests;
4. database/migration validation;
5. production build;
6. relevant end-to-end flows;
7. visual/accessibility/performance checks;
8. dependency/security checks.

Do not invent command names. Read package scripts, composer scripts, CI, and `AGENTS.md`.

## Test Data

Use factories/fixtures and realistic states. Do not copy production secrets or personal data into tests. Make time, randomness, and provider behavior controllable.

## Flaky Tests

Do not retry away uncertainty. Identify nondeterministic clocks, network dependencies, race conditions, shared state, and brittle selectors. Use stable user-visible selectors and deterministic fixtures.

## Release Readiness

Before release verify:

- environment variables and secrets;
- migration and backfill order;
- frontend/backend compatibility window;
- queue workers/scheduler;
- health checks;
- logs and error monitoring;
- backups and restore expectations;
- smoke tests;
- rollback or forward-fix;
- known limitations.

## Evidence Report

Report exactly:

- commands run;
- tests passed/failed/skipped;
- routes and viewports inspected;
- migration/security checks;
- remaining uncertainty.

Do not say `all good` when a required check was not available or did not run.
