# HalalFrFr's Frontend Skills

A modular frontend design and engineering skill system for AI coding agents.

> **Systematic foundation. Expressive surface.**

HalalFrFr's Frontend Skills is a routed collection of 18 focused Agent Skills for building, redesigning, refining, and validating modern frontend experiences without turning every task into one giant prompt.

The system covers:

- creative direction
- design systems
- frontend architecture
- production UI engineering
- responsive composition
- visual fidelity
- interface polish
- accessibility
- performance
- advanced motion
- WebGL / 3D
- shadcn
- resource intelligence
- browser visual QA

## Why

High-end frontend work requires more than code generation.

The visual layer, engineering layer, media layer, motion layer, responsive behavior, and QA layer each require different judgment.

This repository separates those responsibilities into focused skills and uses `frontend-master` to choose the smallest relevant combination.

## 18 Skills

### Core

- `frontend-master`
- `frontend-resource-intelligence`

### Creative

- `creative-direction`
- `design-system-web`
- `asset-direction`
- `interface-polish`

### Engineering

- `frontend-architecture`
- `frontend-ui-engineering`
- `responsive-composition`
- `shadcn-integration`
- `frontend-performance`
- `frontend-accessibility`

### Specialists

- `visual-reference-to-code`
- `extract-design-system`
- `redesign-existing-projects`
- `advanced-motion`
- `web-3d`

### QA

- `visual-qa`

## Quick Install

Clone the repository:

    git clone https://github.com/Asdmir786/halalfrfr-frontend-skills.git
    cd halalfrfr-frontend-skills

### Interactive Setup - Recommended

Run:

    pwsh ./scripts/setup.ps1

The setup wizard offers:

1. Global - Cursor + Codex
2. One Project - Cursor + Codex
3. Advanced Cursor-specific installation
4. Cancel

The recommended global installation uses:

`~/.agents/skills`

so the same HalalFrFr installation can be discovered by supported Cursor and Codex environments.

### Direct / Automated Installation

The underlying non-interactive installer remains available:

    pwsh ./scripts/install.ps1 -Target AgentsUser -Mode Copy

Project-level:

    pwsh ./scripts/install.ps1 -Target AgentsProject -ProjectPath "C:\path\to\project"

Cursor-specific targets are also available through `install.ps1`.

See:

`docs/INSTALLATION.md`
## Example Routing

### Build a premium landing page

Likely flow:

`creative-direction`
→ `frontend-ui-engineering`
→ `responsive-composition`

Add `design-system-web`, `asset-direction`, `advanced-motion`, or `web-3d` only when the concept actually needs them.

### Match a screenshot

Likely flow:

`visual-reference-to-code`
→ `frontend-ui-engineering`
→ `responsive-composition`
→ `visual-qa`

### Redesign an existing dashboard

Start with:

`redesign-existing-projects`

Then route only to specialists identified by the audit.

### Fix a slow page

Start with:

`frontend-performance`

Then route to the owner of the bottleneck when necessary.

## Resource Intelligence

The repository includes a curated external-resource knowledge layer covering more than one hundred resources across:

- accessible UI primitives
- component libraries
- data visualization
- icons
- motion
- WebGL and 3D
- UX research
- conversion research
- marketing inspiration
- typography and color
- AI builder benchmarks
- QA

Resources are references and tools.

They are not automatic dependencies.

The project always prefers:

existing project system
→ existing primitive
→ compatible extension
→ external resource
→ custom implementation

## High-End Without Automatic Complexity

The repository does not assume that premium means:

- GSAP
- Three.js
- glassmorphism
- bento grids
- gradients
- huge typography

Those techniques are valid when they support the concept.

The design should still be intentional without them.

## Existing Projects First

For existing applications the system prioritizes:

- preserving functionality
- preserving architecture
- preserving integrations
- preserving accessible behavior
- minimizing unrelated changes

A redesign does not automatically mean a rewrite.

## Portable Skills

Each canonical skill is a self-contained folder containing:

- `SKILL.md`
- optional `references/`

`frontend-resource-intelligence` additionally carries a generated self-contained copy of its resource catalog.

## Maintenance

Synchronize generated references:

    pwsh ./scripts/sync-all.ps1

Run all repository checks:

    pwsh ./scripts/check.ps1

## Validation

Repository validation checks:

- exactly 18 canonical skills
- frontmatter names
- description presence and size
- combined trigger-description budget
- referenced Markdown files
- generated resource synchronization
- resource manifest integrity
- generated skill registry
- routing eval structure
- required repository files

The description-overlap audit also catches trigger descriptions that become dangerously similar.

## Routing Evals

Representative routing prompts live in:

`tests/routing-cases.csv`

These are designed for manual review and future model-based routing evaluations.

## Documentation

- `docs/ARCHITECTURE.md`
- `docs/INSTALLATION.md`
- `docs/DISTRIBUTION.md`
- `docs/RESOURCE_POLICY.md`
- `docs/RESOURCE_INTELLIGENCE.md`

## External Resources

The resource catalog contains third-party names and links for reference.

No ownership of third-party code, assets, brands, documentation, fonts, or trademarks is claimed.

See:

`NOTICE.md`

## License

Original repository content is available under the MIT License.

See:

`LICENSE`
