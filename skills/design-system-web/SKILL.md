---
name: design-system-web
description: Web design-system strategy for tokens, typography, color, spacing, surfaces, themes, and component variants. Use when repeated visual decisions need a reusable system or normalization.
---

# Design System Web

Turn visual decisions into reusable frontend rules.

This skill owns:

- design tokens
- typography systems
- color systems
- spacing systems
- surface rules
- border rules
- radius rules
- elevation rules
- motion tokens
- responsive token behavior
- component variants
- semantic states
- theming
- system consistency

This skill does not own:

- broad art direction
- application architecture
- React state architecture
- custom animation choreography
- WebGL implementation
- asset creation
- browser QA

Use the relevant specialist skills for those concerns.

## Core Principle

A design system should reduce arbitrary decisions without making every interface look identical.

Use:

systematic foundation
+
expressive composition

Do not turn the design system into a visual cage.

## Existing Project First

Before creating tokens or components, inspect the project.

Look for:

- CSS custom properties
- Tailwind theme configuration
- theme files
- design-token files
- typography utilities
- component variants
- component primitives
- shared layout utilities
- existing color semantics
- dark mode implementation
- Storybook
- components.json
- theme providers
- CSS-in-JS theme objects

Preserve a coherent existing system.

Extend before replacing.

Do not introduce a second token system merely because the existing one uses different naming.

## Token Architecture

Prefer three conceptual layers when the project complexity justifies them.

### Primitive tokens

Raw values.

Examples:

- neutral-50
- neutral-900
- blue-500
- space-4
- radius-md

Primitive tokens describe values, not meaning.

### Semantic tokens

Meaningful roles.

Examples:

- background
- foreground
- surface
- muted
- border
- accent
- danger
- success
- warning
- focus

Semantic tokens allow themes to change without changing component code.

### Component tokens

Use only when a component requires stable specialized behavior.

Examples:

- button-primary-background
- sidebar-width
- card-elevation
- dialog-radius

Do not create component tokens for every CSS property.

## Avoid Token Explosion

Do not create hundreds of tokens merely because a design tool can.

Create tokens for values that are:

- repeated
- meaningful
- theme-sensitive
- system-wide
- likely to change together

Keep true one-off composition values local.

## Color

Build color from roles, not decorative names.

At minimum consider:

- background
- foreground
- surface
- surface-elevated
- muted
- muted-foreground
- border
- input
- accent
- accent-foreground
- destructive
- destructive-foreground
- focus

For data-heavy products, add semantic states only as required.

Examples:

- success
- warning
- info

Do not use semantic colors decoratively if they also communicate state.

## Dark Mode

Dark mode is not color inversion.

Evaluate:

- contrast
- surface hierarchy
- elevation
- borders
- image treatment
- shadows
- saturation
- semantic states

Preserve hierarchy across themes.

## Typography

Define typography as a system.

Consider:

- display family
- functional family
- fallback stack
- scale
- font weight
- line height
- tracking
- paragraph width
- numeric behavior
- label behavior
- uppercase behavior

Prefer one flexible family when it can perform both display and functional roles.

Use a second family only when the visual direction benefits materially.

## Type Scale

Do not require every project to use the same mathematical ratio.

Choose a scale appropriate to:

- viewport size
- content density
- interface type
- brand character

Marketing experiences may need stronger contrast.

Product interfaces often benefit from tighter functional scales.

## Fluid Typography

Use responsive typography intentionally.

Fluid scaling can be appropriate for:

- display headings
- section headings
- large marketing text
- major spacing

Do not make every small UI label fluid.

## Spacing

Use a coherent spacing vocabulary.

Spacing should communicate relationships.

Examples:

tight relationship
< component internal spacing
< content grouping
< section spacing

Do not treat every gap as an independent visual decision.

## Radius

Radius should express the visual system.

Possible behaviors:

- sharp
- restrained
- soft
- highly rounded
- mixed by component role

Do not round everything by default.

Buttons, dialogs, cards, inputs, images, and floating surfaces do not necessarily require identical radius.

## Borders

Define:

- border color
- border opacity
- border width
- emphasized border behavior
- interactive border behavior

Avoid random mixtures of borders, shadows, and glows.

## Elevation

Elevation may use:

- shadow
- tonal contrast
- border contrast
- blur
- layering
- physical overlap

Do not require box shadows for every elevated surface.

Use elevation consistently.

## Surface System

Define recurring surfaces such as:

- page
- section
- card
- elevated
- floating
- overlay
- modal

Not every section needs a card container.

## Motion Tokens

The design system may define motion language such as:

- fast
- standard
- slow
- emphasized
- easing-standard
- easing-enter
- easing-exit

Do not encode complex GSAP timelines as design tokens.

Route complex choreography to:

advanced-motion

## Responsive System

Define:

- container behavior
- content max-width
- gutters
- breakpoint philosophy
- type behavior
- spacing behavior

Breakpoints should respond to layout needs rather than device brand names.

Detailed composition changes belong to:

responsive-composition

## Component Contracts

For reusable components define:

- purpose
- anatomy
- variants
- sizes
- states
- interaction behavior
- accessibility expectations
- content constraints
- responsive behavior

Avoid APIs with dozens of visual boolean props.

Prefer coherent variants.

Read:

references/component-contracts.md

## Variant Discipline

Use variants for meaningful recurring states.

Examples:

Button:

- primary
- secondary
- ghost
- destructive

Do not create:

- blue
- blueDark
- blueSoft
- roundedBlue
- glowBlue

Those are styling fragments, not semantic variants.

## Primitive Ownership

If the project uses:

- shadcn
- Base UI
- Radix UI
- React Aria
- Ariakit
- another established primitive system

preserve its interaction behavior where reasonable.

The design system should style and compose primitives rather than unnecessarily rebuilding accessible behavior.

For shadcn-specific work, route to:

shadcn-integration

## Marketing vs Product Systems

A marketing surface may allow:

- larger type
- dramatic spacing
- stronger imagery
- expressive surfaces
- unusual composition

A product surface may require:

- denser spacing
- predictable interaction
- stronger state semantics
- compact typography
- systematic controls

They may share tokens without using identical compositions.

## Hardcoded Values

Do not ban arbitrary values completely.

One-off values may be valid for:

- hero composition
- illustration positioning
- art-directed marketing sections
- unusual visual effects

Repeated values should migrate into the system.

## Migration Rule

When improving an existing project:

1. inventory repeated values
2. identify actual inconsistencies
3. map existing values
4. preserve compatible names where possible
5. introduce semantic tokens gradually
6. update shared primitives first
7. update repeated components
8. avoid giant visual rewrites unless requested

Read:

references/existing-system-migration.md

## Handoff From Creative Direction

When creative-direction has established a visual thesis, translate it into:

- type system
- color system
- spacing behavior
- surface system
- radius behavior
- border behavior
- elevation behavior
- motion language
- responsive rules
- component variants

Preserve the visual thesis while making it reusable.

## Engineering Handoff

Coordinate with:

frontend-architecture
frontend-ui-engineering

The engineering layer determines the best code structure for the system.

## Final Review

Check:

1. Are repeated decisions tokenized?
2. Are semantic roles clear?
3. Is the system understandable without visual guesswork?
4. Are component variants meaningful?
5. Are themes coherent?
6. Are spacing relationships consistent?
7. Is typography disciplined?
8. Are accessibility states represented?
9. Can marketing remain expressive?
10. Can product UI remain efficient?
11. Can future AI edits follow the system?
12. Can developers modify the system without hunting through many files?

## Supporting References

references/token-architecture.md
references/component-contracts.md
references/existing-system-migration.md

