---
name: responsive-composition
description: Responsive composition for meaningful layout, hierarchy, navigation, media, density, and interaction changes across widths, heights, and input modes. Use beyond trivial breakpoint tweaks.
---

# Responsive Composition

Make the interface feel intentionally designed at every relevant viewport.

This skill owns:

- responsive composition
- layout transformation
- content prioritization
- responsive hierarchy
- responsive density
- breakpoint reasoning
- container behavior
- responsive media treatment
- responsive navigation decisions
- responsive visual sequencing
- mobile composition
- tablet composition
- laptop composition
- wide-screen composition

This skill does not own:

- broad art direction
- general component architecture
- design-token strategy
- detailed accessibility auditing
- complex motion implementation
- WebGL implementation
- final browser QA

Coordinate those concerns with specialist skills.

## Core Principle

Responsive design is not:

desktop
-> smaller desktop

Responsive design is:

same product intent
-> composition appropriate to available space and interaction mode

Preserve meaning and hierarchy rather than pixel geometry.

## Start With Priorities

Before changing layout, identify:

- primary task
- primary message
- dominant visual
- essential controls
- secondary content
- optional decoration

When space decreases, protect the important things first.

Do not preserve decorative complexity at the expense of usability.

## Existing Project First

Inspect:

- current breakpoints
- container utilities
- responsive classes
- layout primitives
- navigation behavior
- typography behavior
- media behavior
- tables
- charts
- sidebars
- dialogs
- mobile-specific components

Do not invent a second breakpoint system without need.

Preserve coherent conventions when they already work.

## Breakpoint Philosophy

Choose breakpoints based on layout stress.

A breakpoint is justified when the composition stops working well.

Do not choose breakpoints merely because they correspond to named devices.

Examples of stress:

- navigation no longer fits
- two columns become too narrow
- media loses its focal point
- text wraps badly
- controls become crowded
- charts become unreadable
- sidebar consumes too much space
- hierarchy collapses

Use the project's existing breakpoint vocabulary when practical.

## Composition Transformation

Possible transformations include:

- columns to stack
- side-by-side to overlapping
- media-left to media-above
- sidebar to drawer
- toolbar to compact menu
- data table to horizontal scroll
- dense control group to progressive disclosure
- decorative layer removal
- horizontal narrative to vertical sequence
- split hero to staged hero
- full navigation to condensed navigation

Do not default every responsive problem to simple stacking.

Read:

references/pattern-transformations.md

## Mobile Is a Composition

Mobile deserves explicit design decisions.

Determine:

- first visible message
- first visible action
- media priority
- information order
- navigation behavior
- touch behavior
- section pacing
- content density

Do not leave mobile as the automatic result of flex-wrap.

## Laptop Matters

High-end marketing pages often fail on ordinary laptops even when they look good at large desktop widths.

Verify:

- hero content fits without accidental clipping
- primary CTA remains visible
- headings do not wrap into excessive lines
- media does not dominate all usable height
- pinned sections remain usable
- fixed elements do not consume too much space

Do not design only for a large external monitor.

## Height Constraints

Responsive design is not only about width.

Consider short viewports.

Examples:

- laptop browser with toolbars
- landscape mobile
- split-screen windows
- small-height embedded views

Avoid requiring large fixed viewport heights when content cannot fit.

Use viewport units carefully.

## Containers

Define intentional behavior for:

- maximum content width
- gutters
- full-bleed media
- readable text width
- nested content widths

Do not make every section use the same maximum width if the visual hierarchy needs different content measures.

Do not let body copy become excessively wide.

## Typography

Responsive typography should preserve hierarchy.

Possible strategies:

- breakpoint-based scaling
- fluid scaling
- controlled line breaks
- different maximum text widths
- reduced display scale
- tighter or looser tracking where appropriate

Do not shrink important display type until it loses character.

Do not preserve desktop font size if it creates unusable wrapping.

Coordinate reusable type behavior with:

design-system-web

## Content Reordering

Change visual order only when it improves comprehension.

Be careful when CSS visual order differs from logical document order.

Keep semantic and keyboard reading order understandable.

Coordinate accessibility-sensitive reordering with:

frontend-accessibility

## Navigation

Responsive navigation may transform into:

- compact horizontal navigation
- overflow menu
- drawer
- sheet
- command interface
- bottom navigation
- tab scroller

Choose based on the product.

Do not use a hamburger menu automatically for every small screen.

## Forms

On small screens:

- maintain clear labels
- preserve touch space
- avoid narrow side-by-side fields when they become difficult
- keep error messages associated with fields
- avoid actions hidden by the software keyboard where practical

## Tables

Possible responsive strategies:

- horizontal scrolling
- sticky key columns
- priority-column reduction
- alternate card representation
- detail drill-down

Do not convert every table into cards automatically.

Preserve comparison capability when that is the reason the table exists.

## Charts and Data Visualization

At smaller sizes consider:

- fewer labels
- simplified legends
- responsive aspect ratio
- alternate orientation
- scroll or drill-down
- removing decorative chart elements

Do not simply scale a dense desktop chart until text becomes unreadable.

## Media

For images and video preserve:

- focal point
- important subject
- text-safe area
- aspect ratio intent

Mobile may require:

- alternate crop
- alternate asset
- different object position
- reduced background complexity

Coordinate asset decisions with:

asset-direction

## Motion

Responsive layouts may need different motion.

Consider:

- reduced travel distance
- shorter timelines
- removing complex pinning
- disabling nonessential parallax
- simplifying scroll choreography
- touch-specific interaction

Do not assume desktop hover and pointer interactions exist on touch devices.

Coordinate complex motion with:

advanced-motion

## 3D

Real-time 3D may require:

- lower detail
- reduced DPR
- simpler effects
- different camera framing
- reduced interaction
- delayed loading
- static fallback

Coordinate implementation with:

web-3d

and performance decisions with:

frontend-performance

## Pointer and Hover

Do not make important functionality depend only on hover.

Consider:

- touch
- coarse pointer
- keyboard
- mouse
- trackpad

Responsive behavior may depend on capability, not just width.

## Density

Application UI may need different density behavior across devices.

Possible changes:

- fewer simultaneous columns
- progressive disclosure
- condensed toolbars
- drawer-based secondary controls
- shorter labels where product copy allows
- simplified metadata presentation

Do not remove essential information merely to make the interface visually sparse.

## Fixed and Sticky UI

Audit:

- sticky headers
- bottom bars
- floating actions
- cookie banners
- chat buttons
- persistent filters

On small viewports multiple fixed layers can consume excessive space.

Preserve the primary task.

## Safe Areas

For mobile web and installable experiences, consider device safe areas when fixed UI touches screen edges.

Use project-appropriate CSS mechanisms when needed.

## Responsive Art Direction

Some high-end experiences need alternate compositions rather than only alternate CSS values.

Examples:

Desktop:
large product render beside editorial copy

Mobile:
product render becomes top focal stage with short copy below

Desktop:
wide horizontal storytelling

Mobile:
vertical sequence

Desktop:
decorative 3D background

Mobile:
lighter static or simplified interactive visual

Preserve the visual thesis even when the implementation changes.

Coordinate visual intent with:

creative-direction

## Implementation Handoff

The actual code should remain maintainable.

Coordinate with:

frontend-ui-engineering
frontend-architecture

Avoid building separate unrelated desktop and mobile component trees unless their structures genuinely differ enough to justify it.

## Responsive QA Matrix

Use a representative matrix rather than checking one mobile and one desktop size.

Read:

references/responsive-qa.md

## Final Review

Check:

1. Is the primary task obvious at every important size?
2. Is the primary visual preserved appropriately?
3. Does typography remain intentional?
4. Are layouts re-composed rather than merely compressed?
5. Does navigation remain usable?
6. Do touch interactions work?
7. Are tables and charts still understandable?
8. Is important content still present?
9. Are media crops correct?
10. Are fixed elements controlled?
11. Does motion remain appropriate?
12. Does the experience work on normal laptop heights?
13. Does mobile still feel like the same product?
14. Are responsive rules maintainable?

## Supporting References

references/responsive-strategy.md
references/pattern-transformations.md
references/responsive-qa.md

