---
name: framework-integration
description: Apply native framework conventions after detection, with first-class Next.js and Laravel guidance without hardcoding either stack.
---


# Framework Integration

## Mission
Adapt general full-stack architecture to the framework actually in use. Frameworks are implementation environments, not the top-level architecture.

## Detect first
Inspect dependencies, directory structure, framework version, runtime/deployment, routing model, auth/data libraries, and current conventions. Do not assume Next.js because TypeScript exists or Laravel because PHP exists.

## General rule
Prefer native lifecycle, routing, dependency, validation, testing, caching, and deployment concepts unless requirements justify deviation.

## Next.js
When detected, reason about:
- server/client boundaries;
- route handlers and/or server actions;
- caching/revalidation;
- middleware;
- auth/session;
- server-side data access;
- internal server operations vs exposed APIs;
- serialization;
- bundle/client-state implications.

Do not make everything a client component or force every mutation through one mechanism.

## Laravel
When detected, reason about:
- routes/controllers/middleware;
- Form Requests/validation;
- policies/gates;
- API Resources/serialization;
- Eloquent relationships/scopes;
- jobs/events/queues;
- transactions;
- service/action boundaries only when complexity warrants them;
- native tests.

Do not mechanically create repository/service layers around every model.

## Other frameworks
Inspect native conventions and apply the same general concerns: contracts, auth, validation, boundaries, data, operations, tests.

## Stable cross-framework concerns
Product requirements, contracts, auth semantics, error semantics, data ownership, approval gates, and QA outcomes remain framework-independent.

References:
- `references/nextjs.md`
- `references/laravel.md`
- `references/framework-detection.md`
