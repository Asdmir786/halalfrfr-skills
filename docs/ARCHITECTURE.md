# Architecture

HalalFrFr's Frontend Skills is a routed collection of focused Agent Skills.

Core philosophy:

**Systematic foundation. Expressive surface.**

The system separates frontend concerns instead of placing every rule into one giant prompt.

## Core

- `frontend-master`
- `frontend-resource-intelligence`

`frontend-master` classifies substantial or ambiguous frontend work and chooses the smallest relevant specialist set.

`frontend-resource-intelligence` selects external libraries, research, inspiration, component sources, motion tools, 3D tools, and QA resources only when external resources are actually needed.

## Creative

- `creative-direction`
- `design-system-web`
- `asset-direction`
- `interface-polish`

These skills move from art direction to reusable visual rules, media decisions, and final design-engineering refinement.

## Engineering

- `frontend-architecture`
- `frontend-ui-engineering`
- `responsive-composition`
- `shadcn-integration`
- `frontend-performance`
- `frontend-accessibility`

These skills keep expressive frontend work maintainable, responsive, accessible, and performant.

## Specialist Workflows

- `visual-reference-to-code`
- `extract-design-system`
- `redesign-existing-projects`
- `advanced-motion`
- `web-3d`

These activate only when their specialized workflow is materially required.

## QA

- `visual-qa`

Visual QA inspects the actual browser-rendered interface and supports screenshot comparison and responsive review.

## Routing

The master router chooses a primary skill first.

Supporting specialists are added only when they own a real constraint.

Example:

Screenshot reconstruction:

`visual-reference-to-code`
→ `frontend-ui-engineering`
→ `responsive-composition`
→ `visual-qa`

Example:

New premium marketing page:

`creative-direction`
→ `design-system-web` when needed
→ `frontend-ui-engineering`
→ `responsive-composition`

`advanced-motion` and `web-3d` are not default ingredients.

They are specialist media used only when the concept justifies them.

## Progressive Disclosure

Each skill keeps its primary workflow in `SKILL.md`.

Deeper material belongs in its own `references/` folder.

The router does not duplicate specialist instructions.

## Resource Layer

The root `resources/` folder is the canonical external-resource dataset.

`frontend-resource-intelligence/references/` contains a generated self-contained copy so that the skill remains portable when installed independently.

Use:

`./scripts/sync-resource-intelligence.ps1`

after modifying canonical resource data.

## Generated Skill Registry

`frontend-master/references/generated-skill-registry.md` is generated from the current skill frontmatter.

Use:

`./scripts/sync-skill-registry.ps1`

after changing skill names or descriptions.

## Validation

Use:

`./scripts/check.ps1`

before committing.
