---
name: observability-operations
description: Design and verify production operations for Vercel frontends, server-hosted NestJS or Laravel APIs, PostgreSQL, queues, cron, storage, integrations, logging, request IDs, metrics, tracing, health checks, alerts, backups, deployment, rollback, and incident diagnosis.
metadata:
  family: halalfrfr
  version: "4.0.0"
---


# Observability and Operations

Production software must explain what it is doing when the UI says nothing useful.

## Structured Logging

Use structured logs with:

- timestamp;
- environment/service;
- severity;
- event/action name;
- request or correlation ID;
- tenant/resource identifiers where safe;
- outcome and duration;
- stable error code;
- provider/job attempt where relevant.

Do not log passwords, tokens, full payment data, sensitive message content, or unnecessary personal data. Redact at the logging boundary.

## Request Correlation

Propagate a request/correlation ID across:

- Vercel/Next.js frontend server calls;
- separate API;
- background jobs;
- provider requests and webhooks;
- user-visible error responses.

This is especially important when frontend and backend are deployed on different platforms.

## Metrics and Events

Track technical health:

- request rate, latency, and errors;
- database pool and slow queries;
- queue depth, age, retries, and failures;
- provider latency/failure;
- deployment and health status.

Track selected business events:

- completed critical workflow;
- failed payment/order/submission;
- entitlement denial;
- delayed operational item.

Do not convert every log line into a metric.

## Health Checks

Provide separate checks as appropriate:

- process/liveness;
- readiness for traffic;
- database connectivity;
- queue/worker status;
- critical provider degradation.

A health endpoint should not expose secrets or detailed infrastructure to the public.

## Jobs and Scheduler

Operate workers with:

- supervised process restart;
- bounded retries/backoff;
- idempotency;
- failed-job visibility;
- timeout;
- safe concurrency;
- deploy compatibility;
- manual replay procedure.

Ensure Laravel scheduler or NestJS cron/worker processes actually run on the server; code configuration alone is not deployment.

## Database Operations

Define:

- automated backups;
- retention;
- encrypted storage/access;
- restore procedure;
- restore testing;
- migration ownership;
- connection pooling and limits;
- monitoring for storage and replication if used.

A backup that has never been restored is an assumption.

## Deployment Order

For Vercel frontend plus separate API:

1. deploy backward-compatible schema expansion;
2. deploy backend that supports old and new clients;
3. deploy frontend;
4. complete backfill/cutover;
5. remove obsolete compatibility only after safe observation.

Adjust according to the actual change. Avoid a frontend that requires an API version not yet live.

## Rollback and Incidents

For meaningful releases define:

- fast rollback target;
- database forward-fix when rollback is unsafe;
- feature flag or kill switch for risky integrations;
- smoke tests;
- owner and evidence;
- logs/dashboard queries needed to diagnose failure.

## Contabo/Server Checklist

For a self-managed API server inspect:

- TLS/reverse proxy;
- firewall and exposed ports;
- process manager/container health;
- OS and runtime patching;
- environment/secret permissions;
- database access restrictions;
- disk, memory, CPU, and inode monitoring;
- log rotation;
- backup destination;
- queue and scheduler supervision.

Do not assume a successful deployment command means the service is operational.
