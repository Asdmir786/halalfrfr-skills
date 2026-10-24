---
name: project-intake-and-docs
description: Create and maintain the eight-document project memory and AGENTS instructions for a new SaaS, dashboard, app, prototype conversion, or undocumented codebase. Use native Plan Mode for discovery, inspect evidence first, scaffold missing files, and keep them concise and current without making the user author technical documents.
metadata:
  family: halalfrfr
  version: "4.0.0"
---

# Project Intake and Documents

Create durable project memory without turning development into paperwork. The agent owns the structure and upkeep; the user provides product intent and approves material decisions.

## Permanent Project Memory

Use these eight documents for substantial software:

1. `PRODUCT.md` — problem, users, outcomes, scope, modules, business rules.
2. `docs/UX.md` — roles, routes, journeys, permissions, states, and responsive behavior.
3. `DESIGN.md` — visual thesis, references, personality, content character, and interaction direction.
4. `docs/UI_SYSTEM.md` — tokens, primitives, components, layout, density, tables, forms, charts, responsive rules, and accessibility implementation.
5. `docs/ARCHITECTURE.md` — system boundaries, modules, runtime, integrations, deployment, jobs, and operations.
6. `docs/DATA_API.md` — entities, relationships, constraints, API contracts, events, migrations, and compatibility.
7. `docs/SECURITY.md` — authentication, authorization, tenancy, entitlements, threats, privacy, and sensitive operations.
8. `docs/QUALITY.md` — commands, test strategy, UI/browser checks, accessibility, performance, release gates, and definition of done.

Also maintain `AGENTS.md`, which tells Cursor, Codex, and other repository agents how to operate.

Split further only after a document becomes difficult to use. Optional files include:

- `docs/features/<feature>.md` for important cross-layer behavior;
- `docs/decisions/ADR-<number>-<decision>.md` for durable architectural decisions;
- `docs/PLAN.md` only for the current substantial implementation plan.

## Use Native Plan Mode

For a new product, undocumented repository, prototype conversion, major redesign, or architecture decision, use the host's native Plan Mode. Let it inspect context, clarify material choices, and create the working plan. Do not replace native planning with a hardcoded questionnaire.

For a simple existing project with enough evidence, scaffold or update the documents directly and continue.

## Scaffold Missing Files

This skill includes templates and a deterministic scaffold script.

Run from the installed skill directory when file creation is appropriate:

```bash
python scripts/scaffold_project.py --project /path/to/project
```

The script creates only missing files by default. Use `--replace` only with explicit authorization because it overwrites existing project memory.

The templates live under `assets/project/` so they remain available when the skill is installed globally.

## Intake Workflow

### 1. Inspect evidence

For a blank project, inspect supplied notes, screenshots, references, files, constraints, and intended deployment.

For an existing project, inspect only what is needed: repository structure, manifests, routes, design tokens, components, schema/migrations, API boundaries, authentication, tests, and deployment configuration.

### 2. Classify the source

- idea only;
- idea plus references;
- HTML or static prototype;
- partial frontend;
- existing frontend with separate backend;
- full existing codebase;
- refactor or migration target.

### 3. Let native planning resolve material decisions

Do not ask the user to choose folders, controller styles, state primitives, database indexes, lint tools, or other routine engineering details.

Clarify only decisions that materially change:

- users, buyer, and phase-one outcome;
- roles, permissions, and ownership;
- must-work journeys and non-goals;
- billing, sensitive data, retention, or external integrations;
- deployment restrictions or irreversible data operations;
- visual direction when no usable evidence exists.

Recommend a sensible default whenever possible.

### 4. Draft or update the files

Use facts from evidence. Mark uncertainty as `TBD`, `Assumption`, or `Decision needed`; never invent product facts.

Keep documents concise initially. Expand only sections needed by current work. Link to code, migrations, routes, or approved screenshots instead of duplicating large implementation details.

### 5. Cross-check consistency

Ensure:

- roles in PRODUCT and UX match authorization in SECURITY;
- journeys in UX match architecture, data, API, and state transitions;
- DESIGN and UI_SYSTEM agree on visual direction and implementation;
- DATA_API owns contracts and invariants rather than ARCHITECTURE duplicating them;
- QUALITY proves critical product and security rules;
- AGENTS points to real paths and repository commands.

### 6. Choose the first complete slice

For new or heavily incomplete software, propose and build one end-to-end flow that proves product value, architecture, permissions, data, and UI behavior before generating every screen.

## Existing Projects

Never overwrite established documents blindly. Merge evidence, preserve confirmed decisions, mark contradictions, and summarize material changes.

If code and documents disagree, determine whether the code is defective, the document is stale, or the product decision changed before rewriting either.

## Keep Memory Alive

Update the relevant document only when a change alters:

- user-visible behavior, scope, or business rules;
- roles, permissions, tenancy, or entitlements;
- system boundaries, providers, deployment, or operational ownership;
- durable data ownership, constraints, contracts, events, or migrations;
- security, privacy, retention, or abuse controls;
- visual direction or reusable UI-system rules;
- quality gates or definition of done.

Do not update documents for insignificant internal edits.
