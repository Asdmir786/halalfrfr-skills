---
name: solution-architecture
description: Design or audit framework-aware full-stack boundaries, preservation strategy, risks, and implementation phases before major changes.
---


# Solution Architecture

## Mission
Translate product requirements into a coherent full-stack design with explicit frontend, backend, data, integration, and contract boundaries. Prefer native project conventions and the smallest architecture that stays understandable and changeable.

## Use when
- new apps or major cross-layer features;
- substantial refactors/migrations;
- existing apps needing architecture audit;
- frontend rebuilds that must preserve backend behavior;
- ownership, module-boundary, or service-decomposition decisions.

## Core rules
1. Inspect the repository before proposing replacement architecture.
2. Distinguish product contracts from implementation choices.
3. Preserve sound working boundaries unless change creates clear value.
4. Do not introduce queues, services, repositories, event buses, distributed systems, or abstractions by habit.
5. Follow detected framework strengths.
6. Keep frontend/backend consistent through `fullstack-contracts`.
7. Treat data migrations, auth changes, public contract changes, and destructive rewrites as high risk.
8. Make reversibility and blast radius explicit.

## Workflow
### 1. Classify
New vs existing, local vs substantial, and preserve/refactor/replace/migrate.

### 2. Map current system
Identify frontend, backend entry points, application/domain rules, data access, auth, integrations, async work, shared contracts, tests/observability, and mixed-concern hotspots.

### 3. Define target boundaries
Describe responsibility/dependency direction for presentation, application/backend, business/domain logic when justified, persistence, integrations, contracts, and background work. Do not create layers with no real responsibility.

### 4. Decide change strategy
Classify areas as **KEEP**, **REFACTOR**, **REPLACE**, or **MIGRATE**. For aggressive frontend rebuilds, protect contracts before deleting presentation code.

### 5. Produce useful artifacts
Update only what helps: `SYSTEM.md`, `FRONTEND.md`, `BACKEND.md`, `DATA-MODEL.md`, `PLAN.md`.

### 6. Handoff
Frontend → existing `frontend-master`; backend → `backend-architecture`; data → `data-architecture`; contracts → `fullstack-contracts`; auth → `auth-and-authorization`; errors → `validation-and-errors`; verification → `fullstack-qa`.

## Approval
For substantial work, return preservation boundaries, risks, assumptions, and phases to `fullstack-master`. Do not begin substantial implementation merely because architecture exists.

## Completion
Ownership, dependencies, contracts, risks, framework conventions, and incremental implementation path are clear.

References:
- `references/change-strategy.md`
- `references/boundary-design.md`
- `references/existing-app-audit.md`
