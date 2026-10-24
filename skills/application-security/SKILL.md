---
name: application-security
description: Threat-model, review, and harden web applications and SaaS products across Next.js, NestJS, Laravel, PostgreSQL, APIs, uploads, webhooks, dependencies, secrets, and infrastructure. Find real vulnerabilities, prioritize by exploitability and impact, and make scoped fixes with tests rather than security theater.
metadata:
  family: halalfrfr
  version: "4.0.0"
---


# Application Security

## Native Planning

For greenfield, broad, risky, cross-layer, or materially ambiguous work, use the host application's native Plan Mode before editing. Let the native planner inspect evidence, ask only material clarifications, and produce a reviewable plan. Do not replace it with a separate scripted questionnaire. For a focused, reversible task with sufficient context, proceed directly after inspection.


Treat security as a product and architecture requirement, not a final scanner pass.

## Scope First

Identify:

- protected assets and sensitive data;
- actors and trust boundaries;
- frontend, API, database, job, storage, provider, and admin surfaces;
- authentication and tenant boundaries;
- public, authenticated, staff, and privileged endpoints;
- likely abuse cases;
- deployment and secret locations.

Use the project's `docs/SECURITY.md` and update it when decisions change.

## Review Areas

### Access control

- missing server authorization;
- IDOR/object-level access;
- cross-tenant access;
- role/entitlement confusion;
- unsafe admin or impersonation paths;
- background jobs losing tenant context.

Route detailed policy work to `auth-authorization-tenancy`.

### Input and output

- validate external input;
- parameterize database queries;
- encode/render untrusted content safely;
- sanitize only when rich content is actually allowed;
- validate redirects and URLs;
- prevent mass assignment/over-posting;
- constrain filters, sort fields, and query complexity.

### Browser security

- XSS;
- CSRF for cookie-authenticated state changes;
- clickjacking and security headers;
- unsafe CORS;
- sensitive tokens in browser storage or bundles;
- open redirects;
- third-party scripts and content security policy.

### Server-side requests and files

- SSRF and URL fetch restrictions;
- DNS/redirect behavior;
- file type, size, count, name, and content validation;
- storage isolation and download authorization;
- image/document processing risk;
- archive extraction and path traversal;
- malware scanning when product risk requires it.

### APIs, webhooks, and jobs

- signature verification using the required raw payload;
- replay protection and idempotency;
- rate limiting and abuse controls;
- timeouts and retry amplification;
- provider payload validation;
- queue poisoning or unsafe deserialization;
- secret leakage in logs.

### Secrets and configuration

- no secrets in source, client bundles, screenshots, logs, or errors;
- least-privilege provider credentials;
- environment separation;
- rotation and revocation plan;
- secure production defaults;
- debug mode disabled in production.

### Dependencies and supply chain

- lockfiles;
- official sources;
- known vulnerabilities;
- abandoned packages;
- install scripts and agent-skill hooks;
- package provenance and typosquatting;
- minimal dependency surface.

Use `dependency-freshness` for upgrades and compatibility.

### Privacy and data lifecycle

- collect only needed data;
- retention and deletion;
- exports;
- audit access;
- backups containing deleted/sensitive data;
- masking and redaction;
- production data in development/test.

## Audit Workflow

1. inspect architecture and trust boundaries;
2. inspect relevant code and configuration;
3. trace high-risk flows end to end;
4. reproduce or prove findings when safe;
5. rank by exploitability, impact, exposure, and confidence;
6. distinguish confirmed vulnerabilities from hardening suggestions;
7. propose the smallest reliable fix and regression test;
8. avoid unrelated refactoring;
9. rerun targeted and automated checks.

For broad audits, report findings before making sweeping edits. Automatically fix only scoped issues the user requested or safe confirmed issues within an approved remediation pass.

## Finding Format

For each finding include:

- severity;
- confidence;
- affected asset and actor;
- attack path;
- evidence and exact location;
- impact;
- remediation;
- regression test;
- residual risk.

Do not inflate severity to sound useful.

## Security Is Not Only Scanners

Use static analysis, dependency audits, secret scanning, and external companion skills where available, but manually verify authorization, tenancy, workflow abuse, provider trust, and business-logic vulnerabilities.

A clean scanner report does not prove the application is secure.
