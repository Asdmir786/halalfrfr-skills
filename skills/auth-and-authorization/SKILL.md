---
name: auth-and-authorization
description: Design and audit authentication, authorization, ownership, tenancy, sessions, roles, and permission enforcement across product layers.
---


# Authentication and Authorization

## Mission
Keep identity and permission behavior explicit, backend-enforced, and consistent across product layers.

## Principles
- Authentication = who is the actor?
- Authorization = may this actor perform this action on this resource?
- Frontend visibility is UX, not enforcement.
- Prefer product policies over scattered role-string checks.
- Tenant/organization boundaries must be authoritatively enforced.
- Prefer mature framework/provider auth mechanisms over custom security schemes.

## Workflow
1. Detect existing auth/session mechanism before changing it.
2. Map actors, roles, ownership, tenancy, privileged operations.
3. Trace enforcement for critical operations.
4. Find frontend-only permission checks, missing ownership/tenant checks, and escalation paths.
5. Define auth expectations in `fullstack-contracts`.
6. Use framework-native middleware/guards/policies where appropriate.
7. Verify allowed and denied paths.

## Approval-worthy
Login/session model, identity provider, token/cookie semantics, role/permission meaning, tenancy boundary, privilege model, recovery/security behavior.

## Frontend
Avoid presenting impossible actions, handle session expiry, render permission-aware states, but never treat hidden controls as security.

## Backend
Authenticate authoritative operations; enforce per resource/action; validate tenant/ownership; return contract-defined auth/permission errors.

## Boundaries
Do not redesign auth just for aesthetic consistency. Do not force RBAC where ownership/policy logic fits better.

References:
- `references/permission-models.md`
- `references/auth-audit.md`
- `references/tenancy.md`
