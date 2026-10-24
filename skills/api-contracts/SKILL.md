---
name: api-contracts
description: Define, implement, and review stable API contracts between frontend, NestJS or Laravel backends, databases, webhooks, and external providers. Covers validation, response models, error codes, pagination, filtering, idempotency, versioning, OpenAPI, typed clients, CORS, retries, and contract tests.
metadata:
  family: halalfrfr
  version: "4.0.0"
---


# API Contracts

An API contract is a product boundary, not a serialization of the database.

## Contract Layers

Keep separate:

- browser form/input model;
- API request schema;
- API response/view model;
- domain model;
- ORM/database model;
- external provider payload.

Map deliberately. Never expose sensitive or internal fields merely because the ORM returned them.

## Request Design

For each endpoint or command define:

- actor and authorization;
- tenant/resource scope;
- method and route;
- path/query/body schemas;
- optional versus nullable behavior;
- normalization;
- idempotency requirement;
- transaction boundary;
- response;
- stable error codes;
- rate limit/abuse concerns;
- audit/logging needs.

Validate all untrusted input at the boundary.

## Error Envelope

Use a predictable structure, for example:

```json
{
  "code": "ORDER_NOT_EDITABLE",
  "message": "This order can no longer be changed.",
  "fieldErrors": {},
  "requestId": "req_..."
}
```

The exact shape may follow the established project. Preserve stable machine-readable codes and avoid parsing human text in the frontend.

Do not expose stack traces, SQL, secrets, or provider credentials.

## HTTP Semantics

Use status codes consistently. Distinguish validation, authentication, authorization, not found, conflict/business rule, rate limit, and unexpected server failure.

Do not return `200` for every failure merely to simplify frontend handling.

## Pagination, Filtering, and Sorting

Define ownership explicitly. For large or changing datasets, prefer server-side pagination and filtering. Use cursor pagination when stable traversal under inserts matters; offset pagination can be sufficient for smaller administrative data.

Validate filter/sort allowlists. Do not pass arbitrary database column names from the client.

## Idempotency and Concurrency

Require idempotency for operations such as:

- payment creation/capture;
- bill issuance;
- order submission;
- webhook processing;
- imports;
- retryable commands.

Use a server-enforced idempotency key and database uniqueness/locking where required. A disabled frontend button is not duplicate protection.

Use optimistic concurrency or state-transition checks when two users/devices may update the same record.

## OpenAPI and Typed Clients

For separate frontend/backend deployments, maintain one contract source and generate or validate a TypeScript client. Regenerate in CI and fail on unreviewed breaking changes where practical.

Do not share backend ORM types directly with the frontend.

## CORS and Authentication

For cross-origin deployments:

- allow only known origins;
- do not combine wildcard origins with credentials;
- define allowed headers/methods;
- test preview/staging behavior;
- configure secure cookies/CSRF or token lifecycle correctly;
- avoid leaking credentials into client bundles.

## Webhooks

Verify signatures against the raw body when required. Store provider event identity, process idempotently, acknowledge within provider timing limits, and move slow work to a queue.

Support safe replay and observable failure.

## Versioning and Change

Prefer backward-compatible additions. When a breaking change is necessary, plan frontend/backend deployment order and overlap so independently deployed versions can coexist temporarily.

## Contract Testing

Test:

- valid request/response;
- validation errors;
- authentication/authorization;
- tenant isolation;
- not found versus forbidden behavior as security requires;
- conflicts and duplicate retries;
- pagination/filtering;
- backward compatibility for public APIs;
- provider/webhook fixtures.
