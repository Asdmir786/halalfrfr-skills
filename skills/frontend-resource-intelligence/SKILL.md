---
name: frontend-resource-intelligence
description: Select and evaluate external frontend libraries, component sources, UX research, inspiration, motion/3D tools, assets, and QA resources. Use only when external resources are needed.
---

# Frontend Resource Intelligence

Use this skill to choose external frontend resources deliberately.

The catalog is a decision-support layer, not a dependency list.

## Core Rule

Prefer the smallest amount of external complexity that solves the actual problem.

Always respect the existing project's:

- framework
- component system
- primitive library
- design system
- tokens
- interaction conventions
- architecture
- accessibility requirements
- performance constraints

Do not replace a working project foundation simply because another resource exists in this catalog.

## Workflow

### 1. Inspect the project first

Before searching external resources, determine:

- what UI stack already exists
- what component primitives already exist
- what design tokens already exist
- what animation libraries already exist
- what charting or visualization libraries already exist
- whether a design system is established
- whether the task can be solved cleanly with current dependencies

If the existing project already contains a suitable solution, prefer it.

### 2. Identify the resource intent

Choose the relevant resource domain.

#### UI foundations

Use for:

- dialogs
- popovers
- menus
- comboboxes
- tooltips
- accessible interactive primitives
- general component foundations

Read:

references/catalog/foundations/ui-primitives.md

#### Components

Use for:

- implementation references
- reusable UI patterns
- creative React components
- marketing components
- dashboards
- visualization components

Read:

references/catalog/components/component-libraries.md

When relevant also read:

references/catalog/components/data-visualization.md

#### Product UX

Use when solving:

- application flows
- onboarding
- checkout
- dashboards
- settings
- account management
- navigation
- forms
- SaaS workflows
- established product patterns

Read:

references/catalog/inspiration/product-ui.md

Product UX references carry more weight than visual-gallery inspiration when designing functional applications.

#### CRO and conversion

Use for:

- landing-page structure
- ecommerce
- checkout
- conversion
- social proof
- calls to action
- persuasion patterns

Read:

references/catalog/inspiration/cro-research.md

Treat evidence-based research as stronger evidence than visual preference.

#### Marketing art direction

Use for:

- premium landing pages
- portfolios
- brand sites
- editorial layouts
- experimental web experiences
- visual composition
- interaction inspiration

Read:

references/catalog/inspiration/marketing-sites.md

Inspiration is not specification.

Do not copy a site's identity or recreate a distinctive design wholesale.

Extract principles such as:

- composition
- scale
- typography
- pacing
- depth
- interaction language
- visual rhythm

Then create an original implementation.

#### Motion

Use when motion materially improves:

- hierarchy
- state change
- continuity
- feedback
- storytelling
- navigation
- spatial understanding

Read:

references/catalog/motion/libraries.md

Preferred complexity progression:

1. CSS transitions and animations
2. Motion
3. GSAP
4. WebGL or Three.js

Do not escalate merely for novelty.

#### 3D and WebGL

Use when the concept benefits from:

- spatial interaction
- product visualization
- depth
- simulation
- immersive storytelling
- shaders
- physically meaningful motion

Read:

references/catalog/3d/webgl-and-tools.md

Also read when relevant:

references/catalog/3d/visual-tools.md

Three.js and React Three Fiber are tools, not visual styles.

Do not add 3D merely to make a page appear premium.

#### Typography, color, icons, and assets

Read:

references/catalog/design/typography-color-assets.md

and:

references/catalog/design/icons.md

Prefer consistency over variety.

Do not introduce multiple icon languages, unrelated type systems, or arbitrary palettes.

#### QA

Use for:

- interaction testing
- visual QA
- component QA
- accessibility
- performance auditing

Read:

references/catalog/qa/testing-accessibility.md

#### AI and visual benchmarks

Read:

references/catalog/benchmarks/ai-builders.md

Use benchmark resources only to evaluate:

- visual quality
- creative ceiling
- workflow quality
- interaction quality
- presentation quality

Do not treat benchmark products as project dependencies.

## Tier Interpretation

### core

Frequently useful and high-confidence.

### strong

High-value specialist resource.

### secondary

Use when project requirements fit.

### optional

Niche, experimental, or stylistic.

### watch

Worth monitoring or comparing, but not a default implementation choice.

### core-benchmark

Primary quality benchmark.

### strong-benchmark

Useful secondary quality benchmark.

### personal

User-curated reference collection.

### unresolved

Known resource whose canonical source has not yet been verified.

Do not recommend an unresolved resource as authoritative.

## External Component Adoption

Never paste external UI code blindly.

Before adopting an external component:

1. inspect dependencies
2. inspect licensing when redistribution matters
3. inspect accessibility
4. inspect responsive behavior
5. inspect rendering model
6. inspect bundle and performance impact
7. inspect styling assumptions
8. inspect animation dependencies
9. adapt it to existing tokens
10. adapt it to existing component architecture
11. remove unnecessary dependencies
12. verify it visually in the real project

External components are implementation inputs, not design authority.

## Resource Selection Strategy

Prefer approximately one primary resource per problem.

Examples:

- primitive behavior: Base UI, Radix UI, or React Aria
- component discovery: 21st.dev
- creative React effects: React Bits or Motion Primitives
- dashboard charts: Recharts, shadcn Charts, or Tremor
- micro-interactions: Motion
- complex scroll choreography: GSAP
- React WebGL: React Three Fiber plus Drei
- product-flow research: Mobbin, Refero, or Page Flows
- conversion research: Baymard, GoodUI, or ABTest.design
- high-end art direction: Awwwards, Godly, or SiteInspire
- browser visual QA: Playwright
- accessibility automation: axe-core

Do not combine many competing libraries when one solves the problem well.

## Existing Project Rule

For an existing project:

existing system
→ existing component
→ existing primitive
→ compatible external pattern
→ custom implementation

Do not start at the external-resource layer.

## New Project Rule

For a new project:

requirements
→ interaction needs
→ design-system needs
→ foundation choice
→ component strategy
→ specialist tooling only where justified

Choose architecture before collecting effects.

## Current Information

External tools and libraries change.

When version-specific behavior, current APIs, compatibility, pricing, licensing, or current product capabilities matter, verify the official source before making a consequential recommendation.

## Supporting References

Canonical dataset:

references/catalog.csv

Machine-readable dataset:

references/catalog.json

Full policy:

references/RESOURCE_POLICY.md

Human-readable resource categories:

references/catalog/

