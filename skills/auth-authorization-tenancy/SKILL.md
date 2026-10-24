---
name: auth-authorization-tenancy
description: Design and verify authentication, sessions, roles, permissions, ownership, organization membership, multi-tenant isolation, plan entitlements, object-level authorization, and cross-origin frontend/backend auth. Use for login, staff roles, SaaS tenancy, IDOR prevention, and access-control tests.
metadata:
  family: halalfrfr
  version: "4.0.0"
---


# Authentication, Authorization, and Tenancy

## Native Planning

For greenfield, broad, risky, cross-layer, or materially ambiguous work, use the host application's native Plan Mode before editing. Let the native planner inspect evidence, ask only material clarifications, and produce a reviewable plan. Do not replace it with a separate scripted questionnaire. For a focused, reversible task with sufficient context, proceed directly after inspection.


Do not collapse four different systems into one `role` check.

## Distinctions

- Authentication: who is the principal?
- Authorization: may this principal perform this action?
- Tenancy: which organization's data is in scope?
- Entitlement: does the plan/account include this capability?
- Ownership/workflow policy: is this specific object editable in its current state?

All relevant checks must pass on the server.

## Authentication

Use a maintained authentication/session implementation appropriate to the stack. Define:

- identity methods;
- account verification and recovery;
- session creation, renewal, expiration, rotation, and revocation;
- multi-device behavior;
- MFA requirements if relevant;
- guest/temporary sessions;
- audit and notification for sensitive account events.

Do not invent password hashing, reset-token, or session cryptography from scratch.

## Browser and Cross-Origin Sessions

For Vercel frontend plus separate API, decide explicitly between secure cookie-based sessions and token/OAuth flows.

Cookie-based flows require correct:

- HTTPS;
- `HttpOnly` and `Secure`;
- `SameSite`/domain behavior;
- CORS credentials;
- CSRF protection;
- trusted origins/proxies.

Do not store long-lived sensitive tokens in local storage by default.

## Authorization Model

Model capabilities, not scattered route-name checks.

Possible inputs:

- global role;
- organization membership role;
- branch/location assignment;
- resource ownership;
- workflow state;
- plan entitlement;
- temporary delegation.

Centralize policies/abilities while keeping resource-specific rules close to the owning module.

## Tenant Context

Resolve tenant context from a trusted server-side relationship:

- authenticated membership;
- verified domain/subdomain mapping;
- signed invitation or temporary session;
- trusted integration credential.

Never trust an arbitrary `tenantId` from the browser as proof of access.

Scope reads and writes by tenant and resource. Do not fetch by object ID and check only afterward when a scoped query can avoid leaking existence.

## IDOR and Object-Level Access

For every object operation test whether a user can alter the identifier to access:

- another tenant;
- another branch;
- another user's private object;
- a resource outside their workflow responsibility.

Hiding the UI control is not security.

## Entitlements

Keep billing/plan access separate from staff permissions.

Example:

```text
authenticated
AND tenant membership
AND role capability
AND object policy
AND plan entitlement
```

Return a distinguishable product response when the feature is plan-disabled versus permission-denied, without leaking sensitive resource existence.

## Administrative and Dangerous Actions

Use stronger controls for:

- changing roles;
- exporting sensitive data;
- refunds/payments;
- deleting tenants;
- changing authentication settings;
- impersonation;
- accessing audit logs.

Consider re-authentication, MFA, approval, notification, and immutable audit events according to risk.

## Testing

Create an access matrix and automate both positive and negative cases:

- unauthenticated;
- wrong role;
- wrong tenant;
- wrong branch/resource owner;
- missing entitlement;
- expired/revoked session;
- invitation reuse;
- direct API attempt despite hidden UI;
- background job/webhook tenant context.

A feature with no negative authorization tests is not production-ready.

## Documentation

Keep roles and permissions consistent across PRODUCT, UX, SECURITY, API contracts, and tests. Record unresolved access decisions explicitly rather than letting each endpoint invent its own rule.
