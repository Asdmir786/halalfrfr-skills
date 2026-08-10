---
name: interface-polish
description: Final interface refinement for spacing, typography, optical alignment, surfaces, borders, shadows, controls, icons, and micro-interactions. Use when the UI is functional but feels unfinished.
---

# Interface Polish

Improve the final layer of perceived quality without unnecessarily changing the product or architecture.

This skill owns:

- visual finishing
- spacing refinement
- optical alignment
- typography refinement
- surface refinement
- border refinement
- shadow refinement
- icon alignment
- control feel
- micro-interactions
- hover behavior
- press behavior
- transition polish
- small motion details
- consistency cleanup
- visual noise reduction

This skill does not own:

- new art direction
- major layout redesign
- repository architecture
- design-system strategy
- complex motion choreography
- real-time 3D
- complete accessibility auditing

Use the relevant specialist skills for those concerns.

## Core Principle

Polish is the removal of friction and visual uncertainty.

Do not confuse polish with decoration.

A polished interface often has:

- fewer competing effects
- clearer relationships
- more consistent spacing
- better optical balance
- more intentional motion
- more disciplined typography

## Inspect Before Changing

Determine whether the interface problem is actually:

- art direction
- architecture
- responsiveness
- accessibility
- performance
- content hierarchy
- final polish

If the visual concept itself is weak, route to:

creative-direction

If the structure requires a meaningful redesign, route to:

redesign-existing-projects

Do not use polish to hide a deeper problem.

## Preserve the Existing Language

When the current interface has an established visual system:

- preserve its character
- normalize inconsistencies
- strengthen weak details
- avoid introducing unrelated trends

A polish pass should normally feel like a better version of the same product.

## Spacing

Inspect relationships rather than isolated numbers.

Look for:

- inconsistent internal padding
- weak grouping
- crowded controls
- oversized gaps
- uneven section rhythm
- misaligned baselines
- inconsistent list spacing

Related elements should feel related.

Unrelated groups should have enough separation.

Do not make everything spacious by default.

Dense product UI may require compact but disciplined spacing.

## Optical Alignment

Mathematical alignment is not always visually balanced.

Inspect:

- icons beside text
- icons inside buttons
- chevrons
- badges
- circular controls
- asymmetric glyphs
- text beside avatars
- logo lockups
- counters and numbers

Small optical corrections may be appropriate.

Do not create arbitrary offsets everywhere.

Read:

references/optical-polish.md

## Typography

Inspect:

- size hierarchy
- weight hierarchy
- line height
- tracking
- paragraph width
- label weight
- numeric alignment
- text wrapping
- muted text contrast
- heading relationships

Avoid:

- too many font sizes
- excessive bold text
- long headings wrapping awkwardly
- weak contrast between hierarchy levels
- tiny supporting text that looks intentionally hidden

Typography should feel calm and deliberate.

## Numbers and Data

For dashboards and numeric UI consider:

- tabular numerals where useful
- consistent decimal treatment
- aligned units
- predictable abbreviations
- visual emphasis on primary value
- restrained supporting labels

Do not make every metric visually dominant.

## Icons

Use one coherent icon family unless the product intentionally mixes languages.

Inspect:

- stroke weight
- visual size
- baseline
- container size
- filled versus outline treatment
- icon-to-text gap

An icon's CSS dimensions do not always equal its perceived visual size.

## Buttons

Inspect:

- height
- horizontal padding
- icon alignment
- text weight
- hover
- active or pressed state
- focus state
- disabled state
- loading state
- radius
- contrast

Primary actions should feel more important without requiring excessive glow or size.

## Inputs

Inspect:

- label
- input height
- padding
- placeholder contrast
- focus state
- error state
- disabled state
- icon position
- help text
- spacing between fields

Controls should feel related to buttons and other interactive surfaces.

## Cards and Surfaces

Do not assume every group needs a visible container.

For surfaces inspect:

- necessity
- border
- background contrast
- elevation
- radius
- padding
- internal hierarchy

Remove unnecessary nested cards.

Use surface hierarchy to clarify structure.

## Borders

Borders should have a consistent visual role.

Avoid:

- random opacity
- random thickness
- glow plus border plus shadow without purpose
- dark borders on some controls and light borders on identical controls

Use emphasized borders selectively.

## Shadows

Shadows should support depth rather than advertise themselves.

Inspect:

- direction
- softness
- spread
- opacity
- consistency with the light model

Not every elevated object requires a visible shadow.

Tonal contrast or borders may be enough.

## Radius

Check consistency with component role.

Do not make every object equally rounded.

A deliberate mixed-radius system may be appropriate if it follows the design language.

## Hover

Hover should communicate interaction.

Good hover may use:

- subtle color change
- border change
- elevation
- icon movement
- underline
- small transform

Do not make elements jump dramatically unless that fits the product character.

Hover is not available on every device.

Important information must not exist only on hover.

## Press and Active Feedback

Actions should feel responsive.

Possible feedback:

- slight scale
- translation
- tonal change
- shadow reduction
- immediate state change

Keep the response quick.

Do not create sluggish controls for cinematic effect.

## Focus

Visible focus is part of quality.

Do not remove focus outlines without providing an appropriate accessible replacement.

Coordinate accessibility details with:

frontend-accessibility

## Micro-Interactions

Use micro-interactions to explain:

- state change
- insertion
- removal
- selection
- expansion
- confirmation
- hierarchy

Do not animate merely because an element appeared on screen.

Read:

references/interaction-polish.md

## Enter and Exit

Entrance and exit behavior should feel related.

When an object appears:

- choose a clear origin
- avoid excessive travel
- keep timing appropriate to importance

When an object exits:

- maintain continuity
- avoid leaving delayed invisible blockers
- ensure interaction state remains correct

Complex choreography belongs to:

advanced-motion

## Motion Timing

Small interface transitions should generally feel immediate.

Long cinematic timings are better reserved for narrative moments.

Do not use one duration for every interaction.

Do not create a large collection of arbitrary durations either.

Coordinate reusable timing with:

design-system-web

## Content Polish

Visual quality can be harmed by content details.

Inspect:

- button labels
- repeated wording
- inconsistent capitalization
- truncated text
- awkward placeholder copy
- unnecessary badges
- redundant labels

Do not rewrite product messaging unless requested, but flag copy that materially harms the interface.

## Image Treatment

Inspect:

- crop
- radius
- border
- background compatibility
- contrast
- image sharpness
- loading placeholder
- dark-mode behavior

Do not add decorative image treatments inconsistently.

## Empty and Loading States

Polish important states too.

Do not make the populated state beautiful and leave loading, empty, and error states visually unfinished.

## High-End Marketing UI

For expressive marketing surfaces, polish may include:

- more deliberate scale
- tighter art-directed alignment
- refined overlap
- controlled material effects
- better transition timing
- refined pointer details

Do not normalize expressive sections until they lose their character.

## Product UI

For SaaS and operational UI, prioritize:

- clarity
- control consistency
- density
- readable states
- predictable spacing
- interaction confidence

Do not make operational software harder to scan in pursuit of visual drama.

## Responsive Polish

A detail that works on desktop may fail on mobile.

Inspect:

- touch target spacing
- line wrapping
- hover-dependent behavior
- border density
- fixed controls
- icon sizing
- surface nesting

Coordinate substantial composition changes with:

responsive-composition

## Performance

Avoid polish techniques that create disproportionate rendering cost.

Be cautious with:

- large blur regions
- continuous filters
- excessive backdrop-filter
- many simultaneous shadows
- unnecessary layout-triggering animation

Coordinate detailed performance work with:

frontend-performance

## Final Polish Pass

Use three passes.

### Pass 1: hierarchy

Check:

- focal point
- grouping
- typography
- major spacing

### Pass 2: components

Check:

- buttons
- inputs
- cards
- icons
- states
- surfaces

### Pass 3: details

Check:

- optical alignment
- borders
- shadows
- micro-motion
- wrapping
- numeric alignment
- visual noise

Do not start with tiny details while hierarchy is still wrong.

## Restraint Test

Ask:

Can anything be removed while making the interface clearer?

Remove:

- redundant borders
- duplicated shadows
- unnecessary badges
- decorative pills
- competing highlights
- extra labels
- meaningless animation

## Final Review

Check:

1. Is spacing relationally consistent?
2. Is hierarchy immediately readable?
3. Does typography feel deliberate?
4. Are icons optically aligned?
5. Are buttons and inputs part of one system?
6. Are surfaces necessary and consistent?
7. Are borders and shadows controlled?
8. Do interactions provide clear feedback?
9. Is focus visible?
10. Are loading and empty states polished?
11. Does mobile retain the same quality?
12. Did the polish pass preserve the product's identity?
13. Did visual noise decrease rather than increase?
14. Does the interface now feel easier to trust and use?

## Supporting References

references/optical-polish.md
references/interaction-polish.md
references/surface-and-type-polish.md

