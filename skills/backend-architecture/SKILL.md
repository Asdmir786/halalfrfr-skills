---
name: backend-architecture
description: Build and refactor maintainable backend boundaries for requests, business logic, persistence, jobs, integrations, and operations.
---


# Backend Architecture

## Mission
Create backend code that is understandable, changeable, testable, and operable without forcing one framework or architectural fashion.

## Rules
1. Detect framework/repository conventions first.
2. Prefer framework-native composition.
3. Separate transport from reusable application/business operations when complexity or reuse justifies it.
4. Keep authoritative business rules backend-side.
5. Make transaction boundaries intentional.
6. Isolate volatile/complex external integrations behind narrow adapters.
7. Avoid god handlers/services.
8. Avoid one-class-per-use-case ceremony when simple modules/functions are clearer.
9. Do not create repository interfaces for every table by default.
10. Organize around meaningful product/module boundaries.

## Workflow
1. Map request entry points, middleware, auth, application logic, persistence, integrations, jobs/events, caching, tests.
2. Decide rule/operation ownership.
3. Define handlers/application boundaries with real responsibilities.
4. Coordinate persistence with `data-architecture` and public behavior with `fullstack-contracts`.
5. Consider transactions, retries/idempotency, timeouts, jobs, caching, logs/metrics, rate limits, concurrency only when relevant.
6. Verify through `fullstack-qa`.

## Framework behavior
Use `framework-integration` for framework-specific choices. Never transplant Laravel patterns into Next.js or vice versa.

## Approval
Major backend boundary changes, public contract changes, auth changes, destructive migrations, and integration replacements belong in the substantial-work plan.

References:
- `references/backend-boundaries.md`
- `references/integrations-and-jobs.md`
- `references/maintainability.md`
