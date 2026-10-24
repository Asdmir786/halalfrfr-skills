# Security, Privacy, and Tenancy

## Security Scope

- application surfaces: TBD
- privileged actors: TBD
- external providers: TBD
- production environments: TBD

## Data Classification

| Data | Classification | Purpose | Storage | Retention | Access |
|---|---|---|---|---|---|
| TBD | public/internal/confidential/restricted | TBD | TBD | TBD | TBD |

Collect and retain only what the product requires.

## Trust Boundaries

```text
TBD
```

Identify browser, frontend server, API, workers, database, storage, providers, admin/support, and webhook boundaries.

## Authentication

- identity methods: TBD
- verification/recovery: TBD
- session/token lifecycle: TBD
- MFA/re-authentication: TBD
- guest/temporary access: TBD
- revocation/device behavior: TBD

## Authorization

- policy/ability model: TBD
- organization/branch/resource scope: TBD
- dangerous actions: TBD
- impersonation/support access: TBD
- audit requirements: TBD

## Multi-Tenancy

- tenant resolution: TBD
- data ownership path: TBD
- query scoping: TBD
- tenant-aware constraints: TBD
- cross-tenant test strategy: TBD
- row-level security if used: TBD

Never trust a browser-supplied tenant ID as proof of access.

## Entitlements

- plan/feature source: TBD
- enforcement location: TBD
- permission versus entitlement behavior: TBD

## Threat Model

| Threat/abuse case | Asset | Attack surface | Control | Test/evidence | Residual risk |
|---|---|---|---|---|---|
| IDOR/cross-tenant | TBD | API/object ID | scoped policy/query | negative tests | TBD |
| XSS | TBD | rendered input | safe rendering/CSP | tests/review | TBD |
| CSRF | TBD | cookie-auth actions | token/origin/samesite | tests | TBD |
| SSRF | TBD | URL fetch/import | allowlist/network controls | tests | TBD |
| Injection | TBD | queries/commands | parameterization/validation | tests/scans | TBD |
| File upload abuse | TBD | upload pipeline | type/size/storage/scan | tests | TBD |
| Webhook replay | TBD | webhook endpoint | signature/idempotency | tests | TBD |
| Brute force/abuse | TBD | auth/public API | rate limits/detection | tests/monitoring | TBD |

Add product-specific business-logic abuse cases.

## Browser and API Security

- CORS origins/credentials: TBD
- CSRF: TBD
- cookie attributes/token storage: TBD
- security headers/CSP: TBD
- rate limiting: TBD
- request size/complexity limits: TBD
- error leakage: TBD

## Input, Output, Files, and URLs

- validation approach: TBD
- rich text/HTML policy: TBD
- URL fetch/redirect policy: TBD
- file type/size/count: TBD
- storage/download authorization: TBD
- malware/content processing: TBD

## Webhooks, Jobs, and Integrations

- signature verification: TBD
- raw body requirements: TBD
- replay/idempotency: TBD
- provider credential scope/rotation: TBD
- retry/failure behavior: TBD

## Secrets and Environment Security

- storage: TBD
- least privilege: TBD
- rotation/revocation: TBD
- redaction: TBD
- production debug mode: TBD
- client bundle exposure check: TBD

## Logging, Monitoring, and Incident Response

- sensitive-data redaction: TBD
- security/audit events: TBD
- alerts: TBD
- incident owner/runbook: TBD
- breach/revocation procedure: TBD

## Dependency and Supply-Chain Security

- lockfiles: TBD
- dependency scanning: TBD
- secret scanning: TBD
- static analysis: TBD
- third-party skill/hook review: TBD
- patch policy: TBD

## Privacy, Retention, Export, and Deletion

- consent/lawful basis where applicable: TBD
- retention: TBD
- user/tenant export: TBD
- deletion and backups: TBD
- production data in non-production: prohibited/TBD

## Security Verification Before Release

- auth/session tests;
- permission and IDOR tests;
- cross-tenant tests;
- input/file/webhook tests;
- dependency and secret scans;
- production configuration review;
- confirmed high-risk findings resolved or accepted explicitly.

## Open Security Decisions and Accepted Risks

- TBD
