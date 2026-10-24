---
name: refactor-existing-codebase
description: Safely audit and refactor an existing, legacy, AI-generated, partially working, HTML/prototype, Next.js, NestJS, Laravel, or mixed codebase. Preserve approved behavior, contracts, data, and visual intent; establish tests and seams; migrate incrementally; and avoid big-bang rewrites.
metadata:
  family: halalfrfr
  version: "4.0.0"
---


# Refactor Existing Codebase

## Native Planning

For greenfield, broad, risky, cross-layer, or materially ambiguous work, use the host application's native Plan Mode before editing. Let the native planner inspect evidence, ask only material clarifications, and produce a reviewable plan. Do not replace it with a separate scripted questionnaire. For a focused, reversible task with sufficient context, proceed directly after inspection.


Refactoring changes structure while preserving intended behavior. Redesign, feature change, framework migration, and refactoring are different scopes.

## Establish the Contract

Before editing identify:

- behavior the user relies on;
- public routes and API contracts;
- database schema and data lifecycle;
- authentication and permissions;
- external integrations and webhooks;
- visual/design-system contracts;
- deployment and environment assumptions;
- existing tests and known defects.

If intended behavior is unclear, use working behavior, project documents, screenshots, tests, and user clarification in that order.

## Audit for Risk

Look for:

- duplicate sources of truth;
- components/services with multiple responsibilities;
- business rules in UI/controller code;
- circular dependencies;
- duplicated API/ORM types;
- tenant/auth checks scattered or missing;
- inconsistent design tokens and component primitives;
- unsafe migrations;
- untested high-risk flows;
- dead code and obsolete dependencies;
- generated patches that contradict one another.

Rank by change risk and value. Do not refactor everything merely because it could be cleaner.

## Characterization Tests

Before changing fragile behavior, add tests that describe what currently happens. Then distinguish:

- intended behavior to preserve;
- confirmed bug to fix;
- accidental behavior that needs product approval.

## Incremental Strategy

Prefer:

1. isolate a boundary;
2. add/strengthen tests;
3. move one responsibility;
4. preserve the public contract;
5. verify;
6. repeat.

Use adapters or strangler-style replacement for external providers, old APIs, or legacy modules where a direct rewrite is risky.

## HTML or Prototype to Production

A prototype can define visual intent and flow, but not automatically:

- component architecture;
- accessibility;
- responsive behavior;
- API contracts;
- state ownership;
- security;
- performance;
- maintainable styling.

Extract the design and interaction system, then rebuild the feature with project-owned components and real backend contracts. Preserve useful assets and behavior; discard accidental inline styles, fake data wiring, and unsafe scripts.

## AI-Generated Codebases

Do not assume all generated code is poor. Preserve coherent areas.

Common repair sequence:

- identify authoritative routes/data/state;
- remove duplicate state synchronization;
- split oversized components/modules at business seams;
- consolidate design tokens and primitives;
- centralize contracts and errors;
- enforce authorization/tenancy;
- add regression tests;
- delete dead alternatives only after references are proven absent.

## Refactor Versus Rewrite

Recommend a rewrite only when evidence shows incremental repair is more dangerous or costly, such as fundamentally incompatible architecture, pervasive untrusted generated code with no reliable behavior, or a required platform change. Explain migration, coexistence, data, rollback, and feature parity.

Do not call a redesign or framework switch a `refactor` to avoid seeking approval.

## Completion

Report:

- preserved contracts;
- structural changes;
- tests added and run;
- behavior intentionally changed;
- migration/rollback risk;
- unrelated suggestions not implemented.
