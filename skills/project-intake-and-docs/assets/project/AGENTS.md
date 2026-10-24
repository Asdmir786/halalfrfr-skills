# Repository Agent Instructions

## Operating Relationship

The user may describe work casually and is not expected to write formal engineering prompts, choose low-level patterns, or review every source line. Translate intent into disciplined work, inspect before acting, and explain results in plain language.

Do not implement unrelated improvements. Put them under `Suggestions not implemented`.

## Read Before Substantial Work

- `PRODUCT.md`
- `docs/UX.md`
- `DESIGN.md`
- `docs/UI_SYSTEM.md`
- `docs/ARCHITECTURE.md`
- `docs/DATA_API.md`
- `docs/SECURITY.md`
- `docs/QUALITY.md`
- relevant `docs/features/*.md` files when present

For a tiny local task, read only the documents and code that materially govern it.

## Native Planning

Use Cursor or Codex native Plan Mode for a new product, broad redesign, unfamiliar repository, architecture change, auth, billing, migration, or risky multi-file refactor. Let the native planner inspect, clarify material decisions, and produce a reviewable plan.

Do not conduct a separate rigid questionnaire. For a small reversible task, inspect, implement, and verify directly.

## Project Snapshot

> The project-intake agent should replace these placeholders from repository evidence.

- Product: TBD
- Frontend: TBD
- Backend: TBD
- Database: TBD
- Package manager: TBD
- Deployment: TBD
- Authentication: TBD
- Multi-tenancy: TBD

## Repository Map

Document the real high-level paths after inspection.

```text
TBD
```

## Commands

Use actual repository scripts. Do not invent commands.

```text
install: TBD
dev: TBD
lint/format: TBD
typecheck/static analysis: TBD
unit/integration tests: TBD
e2e: TBD
build: TBD
database migration validation: TBD
security/dependency checks: TBD
```

## Required Workflow

1. Inspect the relevant implementation, documents, and contracts before editing.
2. Use native Plan Mode when scope, risk, or ambiguity warrants it.
3. Establish the smallest affected boundaries and preserve behavior outside scope.
4. Implement the smallest complete vertical change.
5. Enforce business rules, permissions, tenancy, and data integrity server-side.
6. Run relevant verification and inspect the diff for unrelated changes.
7. Update project memory only when a durable decision changed.
8. Report evidence, failures, remaining risk, and suggestions not implemented.

## Architecture Rules

- Organize around business features/modules.
- Keep one authoritative source for each workflow state and calculation.
- Keep controllers and route handlers thin.
- Do not expose ORM/database models as public API contracts.
- Enforce authorization, tenant scope, ownership, and entitlements on the server.
- Use database constraints in addition to friendly application validation.
- Use jobs for slow or retryable side effects and make them idempotent.
- Do not introduce microservices or infrastructure without demonstrated need and approval.

## Frontend and Design Rules

- Follow `DESIGN.md`, `docs/UI_SYSTEM.md`, and implemented semantic tokens.
- Reuse established accessible primitives and local components before adding another system.
- Treat shadcn source as project-owned; preview upstream changes before overwriting modifications.
- Do not leave new components looking like unadapted library examples.
- Avoid generic AI card grids, fake metrics, decorative charts, excessive pills/gradients/glows, and generic copy.
- Include relevant loading, empty, error, permission, entitlement, pending, and long-content states.
- Preserve keyboard behavior, focus, contrast, touch targets, and reduced motion.
- Inspect mobile, tablet, ordinary laptop height, and desktop when composition changes.

## Security Rules

- Never expose or log secrets, tokens, passwords, payment data, or unnecessary personal data.
- Validate every external boundary.
- Treat browser input, provider payloads, files, URLs, and webhooks as untrusted.
- Do not trust client-supplied tenant IDs, permissions, prices, or totals.
- Test direct API access, IDOR, and cross-tenant denial.
- Do not run destructive production migrations, resets, or data changes without explicit authorization and a recovery plan.

## Dependency Rules

- Use current stable, security-patched, mutually compatible versions rather than blind `latest`.
- Prefer active LTS runtimes in production.
- Preserve lockfiles.
- Review official migration guidance, peer dependencies, security advisories, and deployment support before upgrades.
- Do not add a dependency when the project already has a suitable capability.

## Completion Rules

A change is complete only when the relevant checks pass and behavior is inspected. Report exactly what ran and what remains unverified. Do not present `it should work` as evidence.
