---
name: backend-nestjs
description: Build, review, or refactor a production NestJS backend with TypeScript, modules, controllers, use cases/services, validation, authorization, persistence, jobs, OpenAPI, testing, and deployment. Verify the current compatible NestJS and Node versions before setup or upgrades.
metadata:
  family: halalfrfr
  version: "4.0.0"
---


# Backend NestJS

Use NestJS as a structured application framework, not as a reason to put every concept behind an abstraction.

## Version Policy

For a new project, verify the current stable NestJS release, its Node requirements, and compatibility with selected libraries using official sources. Use an active LTS Node release for production unless a documented constraint requires otherwise.

For an existing project, preserve its major version until an explicit upgrade plan is approved.

## Module Structure

Organize around business capabilities rather than technical folders for the entire application.

A module may contain:

```text
orders/
  orders.module.ts
  presentation/
    orders.controller.ts
    dto/
  application/
    create-order.use-case.ts
    lock-order.use-case.ts
  domain/
    order.policy.ts
    order-transitions.ts
    order.errors.ts
  infrastructure/
    prisma-order.repository.ts
  jobs/
  tests/
```

Use a simpler structure for small modules. Do not introduce layers that contain only pass-through code.

## Responsibilities

- Controller: transport, authenticated context, request/response mapping.
- DTO/schema: boundary validation and documentation.
- Guard/policy: authorization and access scope.
- Use case/service: business workflow and transaction coordination.
- Domain rule: state transitions and invariants.
- Repository/ORM boundary: persistence queries when isolation adds value.
- Job/consumer: asynchronous work and retries.

Keep controllers thin and prevent business rules from living only in decorators or UI code.

## Validation

Validate every external boundary:

- body;
- path parameters;
- query filters;
- headers when relevant;
- environment configuration;
- webhook/provider payloads.

Use one coherent validation approach. Do not maintain two independent schemas without generation or tests preventing drift.

## Authentication and Authorization

Authentication identifies the principal. Authorization and tenant scope must be enforced on the server for each protected operation.

Prefer explicit policies/guards plus scoped data access. Do not depend on route visibility or role strings scattered across controllers.

Route deeper work to `auth-authorization-tenancy`.

## Persistence

Use transactions for operations that must succeed atomically. Add database constraints for invariants such as uniqueness and one-active-record rules.

Avoid generic repositories that erase useful ORM capabilities. Introduce a repository boundary where it protects domain ownership, complex queries, testing, or future provider variation.

## API and OpenAPI

Keep a stable error envelope, pagination rules, idempotency, and versioning policy. Generate or validate the frontend client from the contract when frontend and API deploy separately.

Route to `api-contracts`.

## Jobs and Events

Jobs must define:

- unique/idempotency identity;
- retry policy;
- failure handling;
- visibility/status where users care;
- structured logging and correlation ID.

Do not publish an event before the database transaction is safely committed unless the consistency model explicitly supports it.

## Testing

Use:

- unit tests for pure business rules and transitions;
- integration tests for modules, database constraints, authorization, and transactions;
- contract tests for API behavior;
- end-to-end tests for critical flows.

Test cross-tenant denial and duplicate/retry behavior explicitly.

## Completion

Run repository-standard lint, type checking, tests, build, migration validation, and security checks. Report actual evidence and unverified areas.
