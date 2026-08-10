# Change Safety

Use this process when an AI or developer modifies an existing frontend.

## Before Editing

Determine:

- requested outcome
- files that own the behavior
- existing component API
- dependent call sites
- existing tests
- design-system constraints

## Scope

Change only what is required unless broader refactoring is necessary for correctness.

Do not perform opportunistic unrelated rewrites.

## Shared Components

Before changing a shared component:

- search usages
- understand variants
- identify assumptions
- preserve compatible behavior where possible

## Refactors

Keep refactoring goals explicit.

Good reason:

This state is duplicated and causes inconsistent behavior.

Weak reason:

This file looks too long.

## Visual Changes

Do not destroy working behavior to simplify visual implementation.

## Structural Changes

When structure changes:

- update imports
- update tests
- update call sites
- remove dead code
- verify runtime behavior

## Final Check

Ask:

Did this change improve the requested area without expanding the blast radius unnecessarily?
