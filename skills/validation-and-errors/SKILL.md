---
name: validation-and-errors
description: Align frontend UX validation with authoritative backend rules and stable error semantics across full-stack flows.
---


# Validation and Errors

## Mission
Prevent frontend/backend drift by making validation responsibilities and error semantics explicit.

Frontend validation improves UX. Backend validation is authoritative. Contracts define shared meaning. UI must distinguish actionable failures.

## Workflow
1. Identify input boundaries and current schemas/rules.
2. Separate shape validation, normalization, business rules, authorization, conflict/concurrency, and external dependency failure.
3. Remove duplicated rules that disagree.
4. Define stable machine-meaningful errors in contracts.
5. Map errors to appropriate UI recovery.
6. Preserve unexpected failures for diagnostics; do not convert everything into friendly validation.
7. Test success and important failure paths.

## UI states
Distinguish field errors, form-level business errors, permission, expired session, conflicts/stale state, not found, service failure, and network/offline when relevant.

## Boundaries
Do not expose sensitive server details, call authorization "validation", duplicate every server rule client-side, or flatten all failures into one generic error.

References:
- `references/validation-boundaries.md`
- `references/error-contracts.md`
- `references/form-recovery.md`
