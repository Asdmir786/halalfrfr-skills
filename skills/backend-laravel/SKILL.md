---
name: backend-laravel
description: Build, review, or refactor a production Laravel API or application with current stable Laravel/PHP, Form Requests, Policies, Resources, actions/services, Eloquent, transactions, jobs, events, queues, testing, and secure integration with a Next.js frontend.
metadata:
  family: halalfrfr
  version: "4.0.0"
---


# Backend Laravel

Use Laravel's conventions first. Add structure where business complexity requires it; do not turn a normal Laravel application into an imitation of another framework.

## Version and AI Context

For a new project, verify the current stable Laravel and supported PHP versions from official documentation. For an existing project, preserve the current major version unless an upgrade is requested and planned.

If the repository already includes Laravel-specific agent tooling, use its current project context where helpful. Do not install project packages merely to activate this global skill, and never let generated instructions override explicit project decisions.

## Application Structure

Use Laravel-native responsibilities:

- routes/controllers for HTTP transport;
- Form Requests for validation and authorization where appropriate;
- Policies/Gates for resource and capability authorization;
- API Resources for response contracts;
- Actions or focused Services for reusable business workflows;
- Eloquent models/query objects for persistence;
- Jobs for asynchronous work;
- Events/listeners for decoupled side effects;
- Notifications for delivery channels;
- migrations and constraints for database truth.

Avoid `App\Services` becoming an unstructured dumping ground. Group complex domains by feature or bounded context when scale requires it.

## Next.js Frontend Integration

For a Vercel-hosted Next.js frontend and server-hosted Laravel API, explicitly configure:

- API and frontend origins per environment;
- CORS allowlists;
- Sanctum/session-cookie versus token/OAuth strategy;
- CSRF behavior;
- secure, HTTP-only, same-site cookie settings;
- trusted proxies and HTTPS;
- rate limiting;
- typed OpenAPI client or verified contracts;
- upload and storage paths;
- queue workers and scheduler;
- logs, health checks, deployment, and migrations.

Do not store long-lived bearer tokens in browser local storage by default.

## Validation and Contracts

Use Form Requests or explicit validators at external boundaries. Return API Resources or defined response objects rather than leaking every model attribute.

Use stable error codes for business-rule failures and validation errors that the frontend can handle predictably.

## Authorization and Tenancy

Enforce permissions through policies/abilities and tenant-scoped queries. Do not rely on hidden buttons or a `tenant_id` supplied by the browser.

Resolve tenant context from the authenticated membership, trusted subdomain/domain mapping, or another server-verified source.

Test IDOR and cross-tenant access explicitly.

## Data Integrity

Use database constraints, foreign keys, transactions, and locking where concurrency matters. Application validation improves messages; it does not replace database guarantees.

Use soft deletes only where recovery, audit, or business policy requires them.

## Jobs, Webhooks, and Providers

Jobs and webhook handlers must be idempotent. Verify provider signatures, record delivery/processing identity, and separate provider payloads from domain models.

Define retry, timeout, failure, and replay behavior.

## Testing

Use Pest or PHPUnit according to the established project. Cover:

- business rules;
- policies and tenant isolation;
- validation and API resources;
- database constraints/transactions;
- job retry and idempotency;
- critical end-to-end workflows.

Use factories and realistic states without depending on production data.

## Completion

Run formatting/static analysis when configured, application tests, migration checks, queue/scheduler checks, and the production build/deployment checks relevant to the repository. Report what was actually verified.
