# Token Architecture

## Recommended Conceptual Layers

Primitive
→ Semantic
→ Component

Not every project requires all three layers.

## Primitive Example

color-neutral-950
color-neutral-50
space-4
space-8
radius-md

## Semantic Example

background
foreground
surface
border
accent
danger

## Component Example

sidebar-background
dialog-elevation

Use component-level tokens sparingly.

## CSS Variables

CSS custom properties are usually a strong implementation mechanism because they support:

- themes
- runtime switching
- inheritance
- component composition

Example conceptual structure:

:root

contains semantic variables.

A theme selector or class may override those semantic variables.

Components consume semantic variables rather than raw palette values where appropriate.

## Naming

Names should communicate role.

Prefer:

surface-muted

over:

gray-thing-2

Prefer:

danger

over:

red

when the value represents semantic state.

## Keep Tokens Stable

A token name should survive a palette change.

If changing the brand color requires renaming many tokens, the semantic layer is probably too weak.
