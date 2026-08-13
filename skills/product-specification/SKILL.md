---
name: product-specification
description: Audit PRDs, product ideas, and existing behavior into concise implementation-ready requirements before architecture or coding.
---


# Product Specification

## Mission
Turn a product idea, PRD, feature request, or existing-product brief into the minimum durable product documentation needed for reliable engineering. Own product understanding, not implementation architecture or code.

## Use when
- a PRD, feature brief, product idea, or requirements document is supplied;
- a substantial build has unclear scope, actors, flows, rules, or acceptance criteria;
- an existing application must be understood before redesign, migration, or large refactor;
- product documentation is missing, contradictory, stale, or overly vague.

Do not invoke for a tiny local task whose requirements are already obvious.

## Operating principles
1. Preserve user terminology and business intent.
2. Audit before rewriting; distinguish explicit facts from inference.
3. Do not invent requirements merely to make documentation look complete.
4. Ask only about consequential ambiguity affecting behavior, security, data, architecture, cost, or irreversible choices.
5. Record safe assumptions instead of blocking on routine details.
6. Match documentation depth to project complexity.
7. Keep product requirements framework-independent unless the requirement truly depends on a framework.
8. Separate product behavior from current implementation debt.

## Workflow
### 1. Determine sources of truth
Identify PRD, conversation requirements, existing behavior, screenshots/flows, or mixtures. Record conflicts rather than silently reconciling them.

### 2. Extract the product model
Capture purpose, actors, critical journeys, permissions/ownership, core entities, states/lifecycle, business rules, integrations, non-functional constraints when relevant, and observable acceptance criteria.

### 3. Classify uncertainty
- **Confirmed** — supported by source or observed behavior.
- **Assumed** — safe inference unless corrected.
- **Decision required** — materially consequential ambiguity.

Only the third class normally blocks progress.

### 4. Produce adaptive docs
Small feature: one concise implementation brief may be enough.
Substantial app: create/update only the useful subset of `docs/product/PRD.md`, `REQUIREMENTS.md`, and `FLOWS.md`.

### 5. Handoff
Give `solution-architecture` confirmed scope, assumptions, decisions, critical flows, constraints, acceptance criteria, and preservation requirements.

## Approval
This skill does not approve implementation. Consequential unresolved product decisions must surface before architecture is locked. Final substantial-work approval belongs to `fullstack-master`.

## Boundaries
Do not choose databases/endpoints/frameworks, redesign UI, implement code, or create speculative documentation.

## Completion
A competent engineer should understand what must happen, who may do it, important rules/states, what must be preserved, remaining assumptions, and how success is observed.

Read as needed:
- `references/prd-audit.md`
- `references/documentation-shapes.md`
- `references/existing-product-discovery.md`
