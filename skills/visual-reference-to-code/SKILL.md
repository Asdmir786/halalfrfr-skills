---
name: visual-reference-to-code
description: Implement frontend UI from screenshots, mockups, or supplied visual targets with high fidelity, responsive inference, and project-safe code. Use when the reference is the target.
---

# Visual Reference to Code

Translate a visual target into maintainable frontend code.

This skill owns:

- screenshot analysis
- mockup analysis
- visual decomposition
- reference fidelity
- visual proportion reconstruction
- hierarchy reconstruction
- section reconstruction
- visual asset mapping
- responsive inference from limited references
- implementation fidelity
- visual comparison loops

This skill does not own:

- broad new art direction
- arbitrary redesign
- application-wide architecture
- asset generation by default
- complex motion choreography
- formal accessibility audit
- final performance optimization

Use specialist skills for those concerns.

## Core Principle

Implement what the reference actually communicates.

Do not turn:

match this

into:

design something vaguely inspired by this.

Also do not copy identifiable third-party assets or branding when the user has not provided rights to use them.

## Existing Project First

Before implementation inspect:

- framework
- component architecture
- styling system
- tokens
- existing components
- routes
- assets
- fonts
- state
- responsive utilities
- tests

Preserve working project structure.

Do not rebuild the application around the reference image.

## Determine the Fidelity Goal

Classify the task.

### Faithful reconstruction

The reference is the target.

Prioritize:

- proportions
- hierarchy
- spacing
- typography
- colors
- surfaces
- media placement
- alignment
- responsive intent

### Adaptation

The reference provides a visual direction but the product content or structure differs.

Preserve the visual principles rather than copying every coordinate.

### Partial reference

Only one section, component, or viewport is provided.

Infer only what is necessary.

Do not invent a complete unrelated design system from one small screenshot.

## Analyze Before Coding

Break the visual into:

- page regions
- containers
- sections
- grids
- major alignments
- typography
- media
- controls
- surfaces
- borders
- shadows
- overlays
- decorative layers
- motion clues

Read:

references/visual-analysis.md

## Establish Geometry

Estimate relationships rather than chasing individual pixels immediately.

Identify:

- content width
- outer gutters
- column ratios
- section heights
- major gaps
- media aspect ratios
- alignment anchors
- text measure
- overlap relationships

Build the macro structure first.

Then refine details.

## Typography

Inspect:

- apparent family category
- scale
- weight
- line height
- tracking
- line breaks
- casing
- text width

If the exact font is not available:

1. inspect the project fonts
2. inspect supplied assets
3. choose the closest project-compatible substitute
4. preserve the reference's typographic character

Do not download or introduce random fonts merely because they appear visually similar.

## Color

Extract the important color roles:

- page background
- surface
- foreground
- muted foreground
- accent
- borders
- state colors

Do not create dozens of sampled colors when a smaller coherent palette explains the visual.

Coordinate reusable rules with:

design-system-web

## Assets

Map each visible asset to one of:

- supplied project asset
- existing product screenshot
- existing logo or icon
- CSS-rendered element
- SVG
- photo
- render
- video
- 3D scene
- missing asset requiring separate direction

Do not recreate complex photography with CSS.

Do not generate replacement imagery automatically merely because the original asset is missing.

When a new asset is genuinely needed coordinate with:

asset-direction

## Component Reuse

If the existing project already has a component that matches the required behavior, adapt or reuse it.

Do not replace accessible working controls just to achieve a small visual difference.

Coordinate structure with:

frontend-architecture

and implementation with:

frontend-ui-engineering

## Fidelity Order

When iterating, fix in this order:

1. page structure
2. major composition
3. sizing
4. spacing
5. typography
6. color
7. media
8. surface treatment
9. detail polish
10. motion

Do not spend time perfecting shadows while the layout proportions are wrong.

## Reference Does Not Show Behavior

A screenshot may not reveal:

- hover
- focus
- loading
- error
- keyboard behavior
- responsive behavior
- animation
- expanded states

Use established project behavior and conventional accessible interaction unless the reference or user specifies otherwise.

Do not invent elaborate interactions without evidence.

## Responsive Inference

When only a desktop reference exists, infer mobile from:

- content priority
- alignment
- dominant visual
- expected control behavior
- existing project patterns

Do not preserve desktop coordinates mechanically.

Coordinate substantial adaptation with:

responsive-composition

Read:

references/responsive-inference.md

## Multiple References

When several screenshots exist:

- compare repeated elements
- infer shared tokens
- infer consistent component rules
- identify viewport differences
- identify state differences

Do not treat each screenshot as a separate unrelated page.

## Motion Clues

Static references may imply motion through:

- partially revealed objects
- layered stages
- scroll progression
- directional composition
- repeated sequence frames

Treat these as hypotheses.

Do not implement complex motion without sufficient evidence or user intent.

Coordinate complex motion with:

advanced-motion

## 3D Clues

A reference may contain pre-rendered 3D imagery without requiring real-time WebGL.

Ask whether interaction is visible or required.

If a static render can reproduce the intended experience, real-time 3D may be unnecessary.

Coordinate real-time implementation with:

web-3d

## Visual Comparison Loop

After implementation:

1. render the relevant viewport
2. capture the implementation
3. compare with the target
4. identify the largest visual mismatch
5. correct the underlying cause
6. repeat

Do not make random batches of small tweaks without comparing the result.

Read:

references/fidelity-workflow.md

## Difference Categories

Compare:

- overall silhouette
- section boundaries
- vertical rhythm
- horizontal alignment
- typography
- text wrapping
- media scale
- crop
- color
- borders
- shadows
- radii
- overlays
- responsive behavior

Prioritize high-impact differences.

## Browser QA

Coordinate final rendered comparison with:

visual-qa

Browser screenshots are especially useful for:

- exact spacing
- text wrapping
- overflow
- fixed elements
- responsive behavior
- crop differences

## Accessibility

Do not sacrifice semantics and keyboard behavior to imitate a static screenshot.

Coordinate detailed review with:

frontend-accessibility

## Performance

A visual match should not require obviously wasteful implementation when a simpler technique produces the same appearance.

Coordinate heavy assets, animation, or WebGL with:

frontend-performance

## Final Review

Check:

1. Does the implementation resemble the supplied target at first glance?
2. Are major proportions correct?
3. Is hierarchy correct?
4. Is typography close in character and wrapping?
5. Are media scale and crop correct?
6. Are surfaces and borders consistent?
7. Were existing project components preserved where appropriate?
8. Is responsive behavior credible?
9. Were unsupported behaviors not invented unnecessarily?
10. Is the implementation maintainable?
11. Was visual comparison actually performed?
12. Are remaining differences intentional or documented?

## Supporting References

references/visual-analysis.md
references/fidelity-workflow.md
references/responsive-inference.md

