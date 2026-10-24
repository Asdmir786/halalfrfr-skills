# Project Shapes

## A. New SaaS or dashboard

Use product intake, documents, one design proof, a modular architecture, and one complete vertical slice.

## B. New product with HTML or prototype

Treat the prototype as evidence for intended flow and appearance. Extract useful design and interaction decisions; do not copy prototype architecture or unsafe code into production.

## C. Existing coherent application

Preserve established architecture, public contracts, tokens, primitives, and conventions. Extend them before introducing alternatives.

## D. Existing inconsistent or AI-patched application

Inventory sources of truth, coupling, duplicated state, design inconsistencies, and missing tests. Stabilize seams and migrate incrementally rather than rewriting everything.

## E. Next.js frontend plus separate API

This is a valid default for a Vercel frontend and a NestJS or Laravel API on another server. Explicitly design API origin configuration, CORS, cookie/token behavior, CSRF, typed contracts, timeouts, retries, uploads, webhooks, health checks, observability, deployment order, and database migrations.

## F. Next.js full-stack

Use when the product is sufficiently simple, the deployment model fits, and a separate API does not create clear value. Keep domain logic outside route handlers and server actions so it remains testable.

## G. Backend-only or frontend-only work

Respect the external contract. Do not invent the missing half. Use mocks or contract fixtures only when clearly marked.
