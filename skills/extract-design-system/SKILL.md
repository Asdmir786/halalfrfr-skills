---
name: extract-design-system
description: Extract a reusable design system from an existing codebase or visual reference, including tokens, typography, spacing, components, responsive patterns, and confidence levels.
---

# Extract Design System

Turn repeated visual decisions into an explicit reusable system.

This skill owns:

- design-system observation
- token inference
- color-role extraction
- typography extraction
- spacing inference
- container inference
- radius inference
- border inference
- elevation inference
- component-pattern inventory
- responsive-pattern extraction
- motion-language extraction
- extraction confidence
- starter-token recommendations

This skill does not own:

- copying third-party source code
- reproducing proprietary assets
- complete frontend implementation
- broad redesign
- accessibility certification
- final visual QA

Use specialist skills for those concerns.

## Core Principle

Extract the system behind the interface, not merely a list of sampled values.

A useful extraction explains:

- which values repeat
- what they mean
- where they are used
- how they relate

## Source Types

Possible sources include:

- existing project code
- public website
- screenshot set
- design mockup
- existing application
- design-system documentation

Different sources provide different confidence levels.

## Existing Codebase

When source code is available inspect:

- CSS variables
- Tailwind configuration
- theme objects
- utility classes
- component variants
- typography definitions
- global CSS
- shared components
- breakpoints

Prefer explicit project definitions over visual guessing.

## Visual Source

When only rendered output exists infer:

- repeated colors
- repeated spacing
- container widths
- type hierarchy
- surface relationships
- recurring components
- border and radius behavior
- elevation
- responsive transformations

Mark uncertain values as inferred.

Do not pretend visually estimated values are exact source tokens.

Read:

references/extraction-checklist.md

## Primitive vs Semantic

Distinguish between raw values and roles.

Example:

Raw observation:
dark charcoal

Possible semantic role:
page-background

Raw observation:
lime accent

Possible semantic role:
primary-accent

Do not create semantic names without observing their usage.

## Colors

Identify:

- page backgrounds
- surfaces
- foreground
- muted text
- borders
- accents
- interactive states
- semantic states

Do not treat every anti-aliased sampled pixel as a unique color.

## Typography

Identify:

- font families when knowable
- display hierarchy
- body hierarchy
- labels
- weights
- line height
- tracking
- text measure
- numeric behavior

If the exact font cannot be identified confidently, describe the typography category and visual characteristics rather than guessing.

## Spacing

Infer recurring relationships.

Look for:

- component padding
- control gaps
- content-group spacing
- section spacing
- grid gaps
- outer gutters

Do not create a spacing scale from one isolated section.

## Containers

Identify:

- maximum page width
- readable text width
- full-bleed behavior
- nested content width
- page gutters

Container behavior often explains more of the interface than isolated component dimensions.

## Radius

Look for recurring families:

- sharp
- small
- medium
- large
- pill
- circular

Do not assume all slightly different radii are separate intentional tokens.

## Borders

Extract:

- width
- color role
- opacity behavior
- emphasis behavior

## Elevation

Determine whether depth is created through:

- shadow
- tonal contrast
- border
- blur
- overlap

Do not convert every subtle surface difference into a box-shadow token.

## Components

Inventory recurring structures.

Examples:

- button
- input
- card
- navigation item
- badge
- dialog
- table
- metric
- section header

Describe:

- anatomy
- variants
- states
- spacing
- typography
- surface behavior

## Responsive Behavior

Observe whether:

- columns collapse
- navigation transforms
- type scales
- gutters change
- media crops change
- density changes
- controls move into overflow

Do not infer exact breakpoints from screenshots unless enough evidence exists.

## Motion Language

When visible, identify:

- duration character
- easing character
- travel distance
- reveal style
- scroll behavior
- hover behavior

Do not infer hidden animations from static references.

## Confidence

For every extracted decision classify confidence conceptually as:

- explicit
- strongly observed
- inferred
- uncertain

Read:

references/token-inference.md

## Third-Party Public Sites

A public website can be studied for design principles.

Do not:

- copy proprietary source code
- copy logos
- copy illustrations
- copy photographs
- copy trademarked brand elements

unless the user has the rights and explicitly requests their use.

Extract reusable design logic and create original implementation.

Read:

references/provenance-and-scope.md

## Output Model

A useful extraction may describe:

- color
- typography
- spacing
- containers
- radii
- borders
- elevation
- components
- responsive behavior
- motion
- confidence
- provenance

For implementation of the extracted system coordinate with:

design-system-web

## Existing Project Normalization

When extracting from a codebase with inconsistencies, distinguish:

- intended repeated system
- legacy exceptions
- one-off composition
- accidental inconsistency

Do not blindly promote every repeated mistake into a token.

## Final Review

Check:

1. Were repeated relationships identified?
2. Were roles separated from raw values?
3. Were uncertain observations marked as uncertain?
4. Were one-off values kept separate?
5. Were typography relationships captured?
6. Were containers captured?
7. Were component patterns captured?
8. Was responsive behavior considered?
9. Was motion captured only when observable?
10. Were provenance boundaries respected?
11. Can design-system-web use the result without redoing the entire audit?

## Supporting References

references/extraction-checklist.md
references/token-inference.md
references/provenance-and-scope.md

