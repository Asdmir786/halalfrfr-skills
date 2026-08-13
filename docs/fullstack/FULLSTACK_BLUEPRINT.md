# Full-Stack Blueprint v1

## Goal
Let a coding agent build new full-stack web applications or materially improve existing ones while behaving like a coordinated product engineer, frontend engineer, backend engineer, data engineer, architect, and reviewer.

## Required behavior
- understand product intent before architecture;
- audit existing apps before destructive change;
- create only documentation that reduces rediscovery;
- keep frontend/backend/data consistent through explicit contracts;
- require approval before substantial/destructive implementation;
- remain framework-aware rather than framework-hardcoded;
- support Next.js and Laravel as first-class detected environments;
- reuse the existing frontend skill system;
- explain/teach in context when requested.

## Architecture

`fullstack-master`
- `product-specification`
- `solution-architecture`
- `fullstack-contracts`
- `auth-and-authorization`
- `validation-and-errors`
- `backend-architecture`
- `data-architecture`
- `framework-integration`
- `fullstack-qa`
- existing `frontend-master` → existing 18 frontend skills

## Lanes

### Fast lane
Small, local, low-risk work may proceed directly with verification.

### Planning lane
New apps, major features, rebuilds, migrations, auth changes, destructive data changes, and large refactors require inspection, minimum useful docs, plan, approval, implementation, and verification.

## Design objective
Autonomous inside approved boundaries; explicit approval before crossing consequential product, backend, data, contract, or destructive boundaries.
