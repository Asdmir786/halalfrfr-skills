---
name: advanced-motion
description: Advanced motion and GSAP choreography for timelines, scroll-linked storytelling, pinning, staged reveals, and complex sequencing. Use when motion is a core experience, not routine micro-interactions.
---

# Advanced Motion

Create motion that strengthens hierarchy, continuity, storytelling, and product character.

This skill owns:

- advanced animation choreography
- GSAP-oriented motion
- timeline sequencing
- scroll-linked storytelling
- pinned sequences
- staged reveals
- coordinated section motion
- spatial transitions
- complex entrance and exit systems
- animation cleanup
- motion responsiveness
- motion performance strategy
- reduced-motion alternatives

This skill does not own:

- general art direction
- ordinary button hover polish
- overall component architecture
- design-token strategy
- WebGL scene implementation
- browser visual QA

Use specialist skills for those concerns.

## Core Principle

Motion must have a job.

Valid jobs include:

- explaining hierarchy
- showing cause and effect
- preserving spatial continuity
- guiding attention
- communicating state
- revealing product structure
- supporting narrative
- creating meaningful atmosphere

Do not animate simply because an animation library is available.

## Complexity Ladder

Choose the simplest mechanism that achieves the intended result.

Preferred progression:

1. CSS transition or animation
2. existing project animation utilities
3. Motion or another existing component-motion library
4. GSAP timeline
5. scroll-linked GSAP choreography
6. WebGL or 3D animation when spatial rendering is genuinely required

Do not escalate automatically.

## Existing Project First

Inspect:

- installed animation libraries
- existing timing conventions
- motion tokens
- current scroll behavior
- page-transition behavior
- reduced-motion handling
- reusable animation utilities
- existing GSAP setup
- existing cleanup patterns
- smooth-scroll libraries
- WebGL integration

Do not install a second major motion system merely because another one is familiar.

## Motion Language

Before writing animation code, identify the intended motion character.

Examples:

- precise
- restrained
- cinematic
- mechanical
- elastic
- playful
- physical
- immediate
- spatial
- editorial

Motion character should match the product.

Coordinate visual intent with:

creative-direction

## Micro vs Macro Motion

### Micro motion

Examples:

- hover
- press
- tooltip
- dropdown
- tab
- small state transition

Usually belongs to:

interface-polish

### Macro motion

Examples:

- hero choreography
- scroll storytelling
- product transformation
- pinned sequence
- multi-section timeline
- spatial scene transition
- staged product reveal

Belongs here.

## Timeline Thinking

For complex motion, think in relationships rather than isolated animations.

Define:

- trigger
- start condition
- sequence
- overlap
- emphasis
- pause
- completion
- reverse behavior when relevant

Avoid a page made from unrelated animations with unrelated timings.

## Choreography

Build motion around a narrative.

A useful sequence may include:

1. establish
2. focus
3. transform
4. reveal
5. resolve

Not every interaction needs all five phases.

Use them when the story benefits.

Read:

references/choreography-framework.md

## Scroll-Linked Motion

Use scroll as an input when progression through content genuinely maps to progression through the visual story.

Good uses may include:

- product assembly
- product rotation
- technical breakdown
- before and after transformation
- step-by-step process
- spatial journey
- narrative reveal

Weak uses include:

- making every heading move because the user scrolls
- forcing long pinned sections without enough content
- excessive parallax on ordinary product UI

## Pinning

Pinned sections can be powerful and disruptive.

Before pinning ask:

- does the content require focused progression?
- is the pinned duration justified?
- what happens on short viewports?
- what happens on touch devices?
- what happens with reduced motion?
- can users still understand the content if pinning is simplified?

Do not make a page difficult to escape.

## Scroll Distance

The physical scroll distance should correspond to the amount of narrative change.

Do not require large scroll distance for minimal visual change.

Do not compress a complex story into such a short distance that motion becomes unreadable.

## Scrubbing

Scrubbed animation is appropriate when animation progress should meaningfully follow user scroll progress.

Do not scrub every decorative animation.

Ordinary reveal effects often feel better as triggered transitions.

## Stagger

Use stagger when sequence communicates:

- order
- grouping
- rhythm
- hierarchy

Avoid automatic stagger on long lists.

Large stagger delays can make content feel slow.

## Transform Preference

For high-frequency visual animation, prefer compositor-friendly properties when possible.

Typical animation-friendly properties include:

- transform
- opacity

Be cautious with continuous animation of properties that repeatedly trigger expensive layout or paint work.

Coordinate deeper performance review with:

frontend-performance

## Blur and Filters

Blur and filters can be visually strong and computationally expensive.

Be especially careful with:

- large blurred regions
- backdrop-filter
- animated filters
- multiple full-screen translucent layers

Use them deliberately.

## Smooth Scrolling

Smooth-scroll tooling is optional.

Do not install a smooth-scroll library merely because a cinematic site uses GSAP.

If one already exists:

- understand how it integrates with scroll-triggered animation
- preserve native accessibility expectations where possible
- avoid fighting browser scroll behavior

If one is introduced, it must produce meaningful improvement.

## Motion and React

Keep imperative animation scoped to the component or visual region that owns it.

Avoid:

- uncontrolled global selectors
- timelines that outlive their component
- duplicate initialization
- listeners that are never removed
- scroll triggers that survive unmounting

Use project-compatible cleanup and scoping patterns.

Do not assume one library integration API is stable forever.

For version-specific integration, inspect the installed version and current official documentation.

## Motion and Next.js

When animation requires browser APIs or client-side lifecycle behavior in a Next.js App Router project:

- keep the interactive boundary intentional
- avoid marking an unnecessarily large subtree as client-rendered
- isolate animation-heavy sections where practical

Coordinate structural decisions with:

frontend-architecture

## Responsive Motion

Desktop motion should not automatically be copied to mobile.

Consider:

- shorter distances
- fewer layers
- reduced pinning
- simpler transitions
- no hover-only interactions
- lower animation density
- different sequencing

Coordinate responsive composition with:

responsive-composition

## Reduced Motion

A sophisticated motion system must have a reduced-motion strategy.

When reduced motion is requested or detected, preserve:

- information
- hierarchy
- state
- task completion

Possible alternatives:

- instant state change
- opacity-only transition
- shorter transition
- static composition
- non-pinned content flow

Do not remove important information with the animation.

Read:

references/reduced-motion.md

## Page Transitions

Use page or route transitions only when they improve continuity.

Avoid delaying navigation merely to show animation.

The user should understand that the action succeeded.

Respect the framework's routing and rendering model.

## Text Animation

Text animation can be effective when it supports:

- introduction
- emphasis
- editorial rhythm
- narrative progression

Avoid making ordinary reading difficult.

Do not animate every character on every heading.

Text should remain readable before, during, and after motion.

## Product Animation

For physical products consider whether motion is better implemented through:

- DOM transforms
- rendered video
- image sequence
- shader
- real-time 3D

Coordinate medium selection with:

asset-direction

Real-time 3D implementation belongs to:

web-3d

## Interaction Safety

Animations must not leave:

- invisible overlays blocking clicks
- stale transforms
- unclickable controls
- incorrect z-index states
- hidden focus targets
- unfinished loading states

Animation is part of behavior.

Treat it accordingly.

## Performance

Audit:

- number of simultaneous animations
- layout-triggering work
- scroll handler frequency
- filter cost
- large composited layers
- media decoding
- pinned content
- mobile GPU load

Do not optimize blindly.

Measure or inspect actual problems.

Read:

references/motion-performance.md

## Motion Handoff

A motion specification should identify:

- purpose
- trigger
- target
- initial state
- final state
- duration
- easing character
- sequence relationship
- scroll relationship if any
- responsive behavior
- reduced-motion behavior
- cleanup requirements

## Resource Selection

When choosing between motion libraries or finding implementation references, coordinate with:

frontend-resource-intelligence

## Final Review

Check:

1. Does every major animation have a purpose?
2. Does motion reinforce the visual direction?
3. Are timings coherent?
4. Is hierarchy improved?
5. Is scroll choreography justified?
6. Are pinned sections worth the interruption?
7. Does mobile use appropriate motion?
8. Is reduced motion supported?
9. Is animation scoped and cleaned up?
10. Is content understandable without motion?
11. Are interactions still immediate?
12. Is performance acceptable?
13. Are complex techniques isolated from normal UI code?
14. Would removing an effect make the experience clearer?

If the answer to the final question is yes, consider removing the effect.

## Supporting References

references/motion-selection.md
references/choreography-framework.md
references/reduced-motion.md
references/motion-performance.md

