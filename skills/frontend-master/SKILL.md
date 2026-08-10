---
name: frontend-master
description: Route substantial or vague frontend/UI/UX tasks to the smallest relevant HalalFrFr specialist set. Use for build, redesign, polish, screenshot matching, responsive, motion, 3D, accessibility, or performance work.
---

# Frontend Master

Route frontend work to the smallest useful specialist combination.

This skill is a decision layer.

It is not a replacement for the specialist skills.

## Core Principle

Use:

the smallest relevant skill combination

not:

every frontend skill

The goal is focused expertise with minimal unnecessary context.

## Authority Order

When making frontend decisions, respect this order:

1. explicit user requirements
2. existing project behavior and constraints
3. supplied design references
4. established project design system and architecture
5. relevant specialist skill guidance
6. external resources and general conventions

Do not override an explicit user request merely because a preferred pattern exists elsewhere.

## Scope Discipline

Change what the user asked to change.

Do not silently:

- redesign unrelated areas
- replace libraries
- migrate frameworks
- reorganize the repository
- introduce motion
- introduce 3D
- change branding
- rewrite content
- install dependencies

unless the requested outcome actually requires it.

Suggest unrelated improvements separately instead of implementing them automatically.

## Step 1: Understand the Task

Classify the request before selecting specialists.

Possible task classes include:

- new frontend
- frontend feature
- visual redesign
- small visual polish
- visual reference reconstruction
- responsive work
- design-system work
- architecture work
- component implementation
- external resource selection
- shadcn work
- accessibility
- performance
- advanced motion
- WebGL or 3D
- design-system extraction
- browser visual QA

A request may belong to more than one class.

Do not assume that it belongs to all classes.

## Step 2: Inspect the Existing Project

For existing projects inspect only what is relevant.

Possible evidence includes:

- package.json
- framework
- router
- directory structure
- components
- design tokens
- styling system
- component primitives
- components.json
- animation libraries
- WebGL libraries
- assets
- responsive conventions
- tests
- current implementation

Understand before editing.

Do not apply a new-project workflow to an established application.

## Step 3: Determine the Minimum Specialist Set

Use:

references/routing-table.md

for specialist ownership.

Use:

references/workflow-recipes.md

for common combinations.

Use:

references/conflict-resolution.md

when two skills appear to overlap.

If deeper metadata is useful, read:

references/generated-skill-registry.md

## Specialist Roles

### frontend-resource-intelligence

Use when external frontend resources, libraries, references, inspiration, tooling, or implementation sources need to be selected or evaluated.

Do not invoke merely because frontend work exists.

### creative-direction

Use when the visual concept itself must be created or substantially reconsidered.

Common cases:

- new landing page without a locked design
- new brand or marketing experience
- visually weak concept
- high-end visual direction

Do not invoke for a tiny styling change or faithful screenshot reconstruction unless adaptation requires new direction.

### design-system-web

Use when repeated visual decisions need a reusable system.

Common cases:

- tokens
- themes
- typography system
- colors
- spacing
- component variants
- normalization

Do not invoke for isolated one-off styling.

### asset-direction

Use when imagery or media materially determines the design.

Common cases:

- photography
- renders
- transparent assets
- video
- illustration
- 3D models

Do not invoke when existing project assets already solve the requirement.

### interface-polish

Use for final design-engineering refinement.

Common cases:

- spacing
- optical alignment
- controls
- borders
- shadows
- typography refinement
- micro-interactions

Do not use to replace weak art direction or major structure.

### frontend-architecture

Use when ownership and frontend structure matter.

Common cases:

- substantial new features
- state ownership
- component boundaries
- server and client boundaries
- reusable architecture
- refactoring

Do not invoke for a tiny styling-only change.

### frontend-ui-engineering

Use for production frontend implementation.

Common cases:

- React
- Next.js
- TypeScript
- HTML
- CSS
- Tailwind
- components
- forms
- interaction states

This is a common implementation specialist.

### responsive-composition

Use when the interface needs meaningful adaptation across viewport sizes, heights, or input modes.

Do not invoke only because one simple breakpoint value changed unless composition is affected.

### shadcn-integration

Use when the project actually uses shadcn or the user explicitly wants to adopt it.

Inspect components.json and actual imports.

Do not assume shadcn means one specific primitive base.

### frontend-performance

Use when performance is an explicit goal, an observed problem, or the implementation introduces meaningful performance risk.

Examples:

- heavy JavaScript
- large media
- animation
- WebGL
- layout shifts
- slow interactions
- Core Web Vitals

Do not invoke for ordinary implementation with no meaningful performance concern.

### frontend-accessibility

Use when accessibility needs explicit implementation, remediation, audit, or deeper review.

Baseline semantic and keyboard-conscious implementation still belongs in frontend-ui-engineering.

### visual-reference-to-code

Use when a supplied screenshot, mockup, render, or visual reference is the implementation target.

Prioritize fidelity.

Do not automatically replace the target with a new creative direction.

### extract-design-system

Use when the goal is to understand or formalize the design system behind an existing interface.

### redesign-existing-projects

Use when an existing frontend is being visually redesigned or substantially modernized.

Preserve functionality and established architecture unless changes are explicitly required.

### advanced-motion

Use for macro motion and complex choreography.

Examples:

- GSAP timelines
- scroll storytelling
- pinning
- complex sequencing
- spatial transitions

Do not invoke for ordinary hover and press effects.

### web-3d

Use when real-time 3D or WebGL materially contributes to the experience.

Do not invoke merely to make a page appear expensive or modern.

### visual-qa

Use after meaningful visual implementation when browser rendering or screenshot comparison is available and useful.

Do not use as a replacement for unit tests, accessibility review, or performance measurement.

## Step 4: Determine the Primary Skill

For most tasks select one primary specialist.

Additional specialists should have clear supporting roles.

Examples:

Screenshot recreation:

primary:
visual-reference-to-code

supporting:
frontend-ui-engineering
responsive-composition
visual-qa

New premium landing page:

primary:
creative-direction

supporting:
design-system-web
frontend-ui-engineering
responsive-composition

Add advanced-motion only if the concept requires advanced motion.

Add web-3d only if the concept requires real-time spatial rendering.

## Step 5: Do Not Over-Route

Avoid combinations such as:

creative-direction
+
visual-reference-to-code

when the user explicitly wants a faithful reconstruction and no new direction is needed.

Avoid:

advanced-motion
+
web-3d

merely because the page should feel premium.

Avoid:

design-system-web
+
extract-design-system

unless both extraction and implementation of a reusable system are actually required.

Avoid:

redesign-existing-projects
+
creative-direction

for every redesign.

Use creative-direction only when the existing direction itself needs meaningful change.

## Step 6: Preserve Existing Systems

For an existing project, prefer:

existing architecture
-> existing component
-> existing primitive
-> compatible extension
-> new implementation

Do not start by replacing the system.

## Step 7: Use External Resources Selectively

If external resources are needed, route to:

frontend-resource-intelligence

Do not search dozens of libraries before inspecting the project's existing solution.

External resources are inputs, not automatic dependencies.

## Step 8: Handle Current Technology Carefully

Frontend libraries evolve.

When implementation depends on:

- current APIs
- current CLI behavior
- current framework behavior
- current package compatibility
- current browser behavior
- current standards
- current licensing

verify the installed version and current official documentation when necessary.

Do not encode outdated assumptions into the project.

## Step 9: Implement

Use the selected specialist guidance.

For production code, frontend-ui-engineering is often the implementation layer.

For substantial structural work coordinate with frontend-architecture.

For visual systems coordinate with design-system-web.

For responsive transformation coordinate with responsive-composition.

Do not make the user manage internal routing unless explaining it materially helps.

## Step 10: Verify

Use project-appropriate verification.

Possible checks include:

- type check
- lint
- unit tests
- integration tests
- runtime inspection
- responsive review
- accessibility review
- performance review
- browser visual QA

Run only checks relevant to the change and available in the project.

Do not invent command names.

## Visual QA Rule

After meaningful visual work, use visual-qa when browser or screenshot tooling is available and the task benefits from rendered inspection.

Especially important for:

- screenshot reconstruction
- redesign
- high-end landing pages
- responsive composition
- motion-heavy work
- visually complex components

Tiny isolated changes may not justify a full visual QA loop.

## Accessibility Rule

Do not wait until the end to use semantic HTML and keyboard-conscious primitives.

frontend-ui-engineering should maintain baseline accessibility during implementation.

Use frontend-accessibility for deeper review and remediation.

## Performance Rule

Do not optimize everything preemptively.

Use frontend-performance when there is:

- evidence
- explicit requirement
- meaningful performance risk

Heavy motion, large media, and WebGL are examples of meaningful risk.

## High-End Frontend Rule

High-end does not automatically mean:

- GSAP
- Three.js
- glassmorphism
- bento
- gradients
- huge typography

High-end means the visual and interaction system is appropriate, intentional, well executed, responsive, and technically sound.

Technology should serve the concept.

## Vague Requests

For requests such as:

- make this better
- improve this UI
- fix the frontend
- make it premium
- polish this page

first inspect the existing interface.

Determine whether the real problem is:

- creative direction
- composition
- design system
- implementation
- responsiveness
- polish
- accessibility
- performance

Route according to the actual problem rather than the adjective in the prompt.

## New Frontend

For a substantial new frontend with no locked design, the likely starting sequence is:

creative-direction
-> design-system-web when a reusable system is needed
-> frontend-architecture when structural complexity warrants it
-> frontend-ui-engineering
-> responsive-composition

Then add specialist skills only when justified.

## Existing Frontend

For an existing frontend:

inspect
-> preserve
-> classify weakness
-> select smallest specialist set
-> change
-> verify

Do not automatically invoke creative-direction.

## Screenshot or Mockup

For a supplied target:

visual-reference-to-code
-> frontend-ui-engineering
-> responsive-composition when needed
-> visual-qa

Use asset-direction only when missing assets materially block fidelity.

Use advanced-motion only when motion is actually specified or strongly evidenced.

## Redesign

For an existing product redesign:

redesign-existing-projects

Then add only what the audit identifies:

- creative-direction
- design-system-web
- frontend-architecture
- responsive-composition
- asset-direction
- interface-polish

Finish meaningful visual changes with visual-qa when tooling permits.

## Small Polish

For small visual refinement:

interface-polish

and when code changes are required:

frontend-ui-engineering

Do not pull the full design stack.

## Performance Task

For a performance-specific request:

frontend-performance

Add a domain specialist only when the bottleneck belongs there.

Examples:

animation bottleneck:
advanced-motion

WebGL bottleneck:
web-3d

## Accessibility Task

For an accessibility-specific request:

frontend-accessibility

Add frontend-ui-engineering when remediation requires code implementation.

## shadcn Task

For shadcn-specific work:

shadcn-integration
+
frontend-ui-engineering when implementation is required

Add design-system-web only if the task changes the design system.

## Completion Rule

Finish when the requested outcome is achieved and relevant verification passes.

Do not continue expanding the task merely because more improvements are possible.

## Supporting References

references/routing-table.md
references/workflow-recipes.md
references/conflict-resolution.md
references/generated-skill-registry.md

