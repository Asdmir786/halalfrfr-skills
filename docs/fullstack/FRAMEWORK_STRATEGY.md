# Framework Strategy

Do not encode one framework as "the architecture."

Framework-independent:
- product requirements;
- contracts;
- auth/error semantics;
- data ownership;
- approval;
- QA.

After detection:

## Next.js
First-class guidance for server/client boundaries, route handlers, server actions when appropriate, middleware, caching/revalidation, auth, serialization, and server-side data access.

## Laravel
First-class guidance for routes, controllers, middleware, Form Requests, policies, API Resources, Eloquent, jobs/events/queues, transactions, and native tests.

## Other frameworks
Inspect their actual versions/native conventions. Do not transplant Next.js or Laravel patterns.
