---
name: visual-qa
description: Browser-based visual QA for rendered pages, screenshots, responsive states, target comparison, overflow, crops, visual regressions, and iteration after meaningful UI changes.
---

# Visual QA

Evaluate the rendered interface, not only the source code.

This skill owns:

- browser visual inspection
- screenshot review
- responsive screenshot review
- visual defect identification
- target-versus-render comparison
- overflow review
- crop review
- hierarchy review
- visual regression review
- visual iteration
- rendered-state inspection

This skill does not own:

- unit testing
- backend testing
- formal accessibility auditing
- performance profiling
- new art direction
- broad architectural refactoring

Use specialist skills for those concerns.

## Core Principle

Frontend source code can look correct while the rendered interface is wrong.

Always inspect meaningful visual work in a browser when tooling permits.

## Establish the QA Target

Determine whether QA is against:

- supplied screenshot
- mockup
- design specification
- existing production baseline
- creative-direction intent
- general quality expectations

Different targets require different comparisons.

## Representative Routes

Identify the routes or surfaces affected by the change.

Do not screenshot the entire product blindly.

Prioritize:

- changed route
- changed component context
- critical user flow
- shared component usages

## Representative States

Visual QA should include relevant states such as:

- default
- loading
- empty
- error
- expanded
- selected
- modal
- menu
- long content

Only test states relevant to the change.

## Viewport Matrix

Use representative viewport classes.

Read:

references/screenshot-matrix.md

Do not evaluate responsiveness from one desktop screenshot.

## Capture

When browser automation is available, capture deterministic screenshots where practical.

Control relevant variables such as:

- viewport
- route
- state
- theme
- content
- animation timing when necessary

Do not hide real layout problems by cropping the screenshot around them.

## First-Pass Review

Inspect:

- overall composition
- hierarchy
- layout
- clipping
- overflow
- text wrapping
- spacing
- media crop
- fixed elements
- broken states

Do not begin with tiny shadow differences.

## Defect Priority

Prioritize:

### Critical

Examples:

- unusable layout
- hidden primary action
- content overlap
- major overflow
- unreadable text
- broken mobile navigation

### Major

Examples:

- wrong hierarchy
- major spacing mismatch
- incorrect media scale
- bad responsive transformation
- obvious visual inconsistency

### Minor

Examples:

- subtle optical alignment
- small radius difference
- minor shadow mismatch

Read:

references/visual-defect-taxonomy.md

## Reference Comparison

When a target image exists compare:

- overall silhouette
- section heights
- container width
- alignment
- text wrapping
- media scale
- crop
- colors
- borders
- radii
- shadows
- decorative layers

Prioritize the biggest perceptual mismatch.

Coordinate faithful reconstruction with:

visual-reference-to-code

## Existing Project Comparison

During redesign compare before and after.

Ask:

- what improved?
- what regressed?
- what behavior changed unintentionally?
- what visual identity was lost?
- what state is now weaker?

Coordinate redesign with:

redesign-existing-projects

## Responsive QA

Look for:

- horizontal overflow
- clipped content
- hidden controls
- poor wrapping
- excessive fixed UI
- collapsed hierarchy
- broken sticky elements
- wrong media crop
- unusable tables
- mobile-only dead space

Coordinate substantial fixes with:

responsive-composition

## Laptop QA

Always consider ordinary laptop widths and heights for high-end websites.

Common failures:

- hero too tall
- CTA below viewport
- headline wraps excessively
- visual covers text
- pinned story does not fit
- navigation becomes crowded

Large desktop screenshots alone are not enough.

## Typography QA

Inspect:

- font actually loaded
- fallback flash when relevant
- heading wrapping
- body width
- label clipping
- line height
- hierarchy
- numeric alignment

## Media QA

Inspect:

- source loaded
- crop
- aspect ratio
- focal point
- transparency
- resolution
- dark-mode treatment
- fallback

Coordinate asset changes with:

asset-direction

## Interaction Visual QA

Where tooling allows inspect:

- hover
- focus
- open
- selected
- pressed
- disabled
- loading

Do not evaluate interactive components only in their default state.

## Motion QA

For motion-heavy sections inspect:

- initial state
- active progression
- final state
- cleanup
- layout after animation
- reduced-motion behavior

Coordinate motion defects with:

advanced-motion

Static screenshots cannot evaluate the full quality of motion.

Use them to inspect key frames and layout states.

## 3D QA

For WebGL inspect:

- loading state
- camera framing
- object crop
- lighting
- fallback
- mobile framing
- canvas integration

Coordinate scene defects with:

web-3d

## Accessibility Boundary

Visual QA can notice:

- missing visible focus
- weak contrast
- tiny controls

but it does not replace an accessibility audit.

Route detailed review to:

frontend-accessibility

## Performance Boundary

Visual QA can notice:

- delayed content
- visible jank
- late layout movement

but it does not replace performance measurement.

Route detailed diagnosis to:

frontend-performance

## Iteration Loop

Use:

1. render
2. inspect
3. identify highest-impact defect
4. diagnose cause
5. modify
6. render again
7. compare

Read:

references/iteration-loop.md

Do not make ten unrelated visual changes between screenshots when controlled iteration is possible.

## Browser Console

Visual work should not introduce obvious runtime errors.

When browser tooling provides console access, inspect relevant errors.

Do not ignore repeated rendering or asset errors merely because the screenshot looks correct.

## Completion

Do not continue polishing indefinitely.

Stop when:

- requested target is achieved
- critical defects are gone
- major defects are resolved
- remaining differences are low impact or intentional

## Final Review

Check:

1. Was the real rendered page inspected?
2. Were relevant routes inspected?
3. Were relevant states inspected?
4. Were multiple viewport classes inspected?
5. Was normal laptop size included where relevant?
6. Was overflow checked?
7. Was text wrapping checked?
8. Was media crop checked?
9. Were interactions visually reviewed where relevant?
10. Was comparison performed against the target or baseline?
11. Were high-impact issues fixed first?
12. Was the page re-rendered after fixes?
13. Are remaining differences intentional?

## Supporting References

references/screenshot-matrix.md
references/visual-defect-taxonomy.md
references/iteration-loop.md
references/browser-checklist.md

