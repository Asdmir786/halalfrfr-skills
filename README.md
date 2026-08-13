# HalalFrFr Skills

**Systematic foundation. Expressive surface. Coherent full stack.**

HalalFrFr Skills is a modular Agent Skills system for building and improving production web applications with AI coding agents.

The unified package contains **28 skills**:

- 18 frontend design and engineering skills
- 10 full-stack product, architecture, backend, data, contract, and QA skills

The system supports both new applications and existing codebases.

For substantial work, the intended operating model is:

**understand → audit → document → propose → explain → approve → implement → verify**

Small, low-risk changes can use a faster inspect → implement → verify path.

## What it is designed for

- premium landing pages
- SaaS and dashboard products
- existing-product redesigns
- ground-up frontend rebuilds
- full-stack features
- PRD-driven applications
- backend architecture
- API and frontend-backend consistency
- auth and authorization
- data architecture
- responsive UI
- motion and 3D when justified
- accessibility and performance
- cross-layer QA
- guided engineering explanations when requested

## Framework strategy

The architecture is framework-aware rather than framework-hardcoded.

First-class guidance exists for:

- Next.js
- Laravel

The skills detect the actual project and prefer its native conventions.

## Skills

### Full-stack core

- `fullstack-master`
- `product-specification`
- `solution-architecture`

### Contracts and product boundaries

- `fullstack-contracts`
- `auth-and-authorization`
- `validation-and-errors`

### Backend and data

- `backend-architecture`
- `data-architecture`
- `framework-integration`

### Full-stack QA

- `fullstack-qa`

### Frontend core

- `frontend-master`
- `frontend-resource-intelligence`

### Creative direction

- `creative-direction`
- `design-system-web`
- `asset-direction`
- `interface-polish`

### Frontend engineering

- `frontend-architecture`
- `frontend-ui-engineering`
- `responsive-composition`
- `shadcn-integration`
- `frontend-performance`
- `frontend-accessibility`

### Frontend specialists

- `visual-reference-to-code`
- `extract-design-system`
- `redesign-existing-projects`
- `advanced-motion`
- `web-3d`

### Visual QA

- `visual-qa`

## Installation

Clone:

    git clone https://github.com/Asdmir786/halalfrfr-skills.git
    cd halalfrfr-skills

Recommended global installation:

    pwsh ./scripts/setup.ps1

The default installs all 28 skills into:

`~/.agents/skills`

For explicit installation targets:

    pwsh ./scripts/install.ps1 -Target AgentsUser -Mode Copy

Project-only:

    pwsh ./scripts/install.ps1 -Target AgentsProject -ProjectPath "C:\path\to\project"

Cursor-specific targets remain available through `install.ps1`.

## Existing skills

The installer manages only HalalFrFr skill names recorded by its manifest.

Unrelated skills are preserved.

Unmanaged same-name collisions are blocked unless `-Force` is explicitly supplied.

## Resource intelligence

The frontend resource-intelligence layer contains the curated implementation, UX, motion, component, 3D, design, and QA resource catalog used by the frontend specialists.

Resources inform decisions; they are not blindly injected into every task.

## Documentation

See:

- `docs/ARCHITECTURE.md`
- `docs/INSTALLATION.md`
- `docs/RESOURCE_POLICY.md`
- `docs/fullstack/FULLSTACK_BLUEPRINT.md`
- `docs/fullstack/APPROVAL_PROTOCOL.md`
- `docs/fullstack/DOCUMENTATION_STANDARD.md`
- `docs/fullstack/FRAMEWORK_STRATEGY.md`

## Development

Synchronize generated files:

    pwsh ./scripts/sync-all.ps1

Run the complete repository checks:

    pwsh ./scripts/check.ps1

## License

MIT. See `LICENSE` and `NOTICE.md`.
