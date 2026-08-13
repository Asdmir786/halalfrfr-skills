---
name: fullstack-master
description: Route substantial full-stack work across product, frontend, backend, data, contracts, approval, teaching, and QA.
---


# Full-Stack Master

## Mission
Orchestrate building or changing full-stack web applications. Understand the product and existing system, select the smallest relevant specialist set, keep frontend/backend/data/contracts aligned, and prevent substantial implementation from starting before the user understands and approves the proposed direction.

Do not replace specialist skills with one giant workflow.

## Execution lanes

### Fast lane
Proceed directly for clearly local, low-risk work such as isolated UI polish, a narrow bug, local build/type errors, a small endpoint correction with no contract impact, or a minor responsive fix. Inspect relevant code and verify.

### Planning lane
Use audit → plan → approval before substantial implementation for:
- new applications;
- PRD-driven builds;
- major cross-layer features;
- architecture changes;
- major refactors;
- risky migrations;
- auth/permission changes;
- full frontend rebuilds;
- backend replacement;
- large redesigns;
- destructive operations.

## Specialist routing
Use only what is materially relevant:
- `product-specification` — PRD/product understanding.
- `solution-architecture` — boundaries and change strategy.
- `fullstack-contracts` — frontend/backend interaction source of truth.
- existing `frontend-master` — substantial frontend work.
- `backend-architecture` — backend structure.
- `data-architecture` — data/invariants/migrations.
- `auth-and-authorization` — identity/permissions.
- `validation-and-errors` — validation/error semantics.
- `framework-integration` — native Next.js, Laravel, or detected framework choices.
- `fullstack-qa` — cross-layer verification.

## Substantial-work workflow

### 1. Understand
Inspect supplied PRD/context and repository. Use `product-specification` if product intent needs durable clarification.

### 2. Audit
For existing systems identify what works, product contracts, frontend/backend/data boundaries, architectural debt, and integration risk.

### 3. Propose
Use specialists to create the minimum useful docs and a concrete implementation plan.

### 4. Present approval brief
Before substantial implementation, clearly show:
- What I found
- What I propose
- Frontend changes
- Backend changes
- Data/migration changes
- Contracts/integration changes
- What remains untouched
- What will be KEEP / REFACTOR / REPLACE / MIGRATE
- Risks and assumptions
- Implementation phases
- Verification plan

Then explicitly request approval.

### 5. Implement after approval
Execute incrementally. Do not repeatedly ask about routine choices inside the approved boundary unless scope materially changes.

### 6. Verify
Use `fullstack-qa` and existing frontend QA specialists.

### 7. Reconcile docs
Update durable docs to describe what was actually built; remove stale planned behavior.

## Ground-up frontend rebuild mode
When the user explicitly wants the existing presentation frontend discarded:
1. treat old UI architecture as disposable evidence;
2. document frontend-backend contracts and critical flows;
3. identify mixed files containing integration/business behavior;
4. extract/reproduce required behavior;
5. checkpoint the protected contract;
6. request approval for demolition;
7. replace presentation frontend through existing `frontend-master`;
8. reconnect feature-by-feature;
9. verify documented behavior.

Do not preserve old React/TSX/CSS/Tailwind code merely because it exists. Do not delete before extracting knowledge needed to reproduce the product.

## New application mode
Product specification → architecture → contracts → data/auth → frontend/backend plan → approval → incremental build → QA. Skip docs that do not reduce ambiguity.

## Guided / teaching behavior
If the user asks to learn, understand, or be taught:
- explain important decisions in context;
- define jargon briefly;
- explain useful tradeoffs/alternatives;
- keep implementation moving unless theory-only was requested.

Do not turn normal execution into a textbook.

## Autonomy
Make routine choices inside approved scope. Ask only when product behavior is genuinely ambiguous, a destructive/risky boundary changes, choices have materially different business consequences, or approved scope must change.

## Completion
Approved scope is implemented; frontend/backend/data agree with contracts; critical flows are verified; docs reflect reality; remaining limitations/risks are explicit.

References:
- `references/approval-gates.md`
- `references/routing-table.md`
- `references/new-app-workflow.md`
- `references/existing-app-workflow.md`
- `references/teaching-mode.md`

## Generated registry

For the current unified skill inventory, read:

`references/generated-skill-registry.md`
