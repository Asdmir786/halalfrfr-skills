---
name: fullstack-qa
description: Verify critical behavior across frontend, API, backend, auth, data, integrations, migrations, and end-to-end user flows.
---


# Full-Stack QA

## Mission
Prove important product behavior works across layers after implementation/refactor. Complement existing frontend `visual-qa`; own cross-layer correctness rather than visual fidelity.

## Strategy
Choose the cheapest test that proves meaningful risk:
- unit for isolated rules;
- integration for persistence/application boundaries;
- API/contract tests for transport/auth/error semantics;
- migration verification;
- adapter tests/mocks;
- browser/E2E for critical journeys.

Do not maximize test count.

## Workflow
1. Build risk map from requirements, architecture, contract changes, and diff.
2. Prioritize auth, writes/destructive actions, payments/side effects, tenancy, migrations, high-value workflows, complex state transitions.
3. Update `docs/implementation/TEST-PLAN.md` for substantial work.
4. Run project-native lint/type/test/build checks.
5. Verify success plus important error/permission/conflict contract states.
6. Verify critical journeys with browser/E2E where valuable.
7. Delegate visual/responsive/accessibility/performance QA to existing frontend specialists.
8. Report what was verified, unverified, failed, and residual risk.

## Rebuild
For ground-up frontend rebuilds, use the pre-rebuild dossier, verify each documented critical flow, compare behavior rather than old pixels, verify auth/error/loading states, then run visual QA on the new design.

References:
- `references/test-by-risk.md`
- `references/critical-flow-checklist.md`
- `references/rebuild-verification.md`
