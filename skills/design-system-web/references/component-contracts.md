# Component Contracts

A reusable component should have a clear contract.

## Define

- purpose
- required content
- optional content
- variants
- sizes
- states
- behavior
- accessibility
- responsive behavior

## Good Variant Model

Button:

- primary
- secondary
- ghost
- destructive

Sizes:

- sm
- md
- lg

States are generally behavior, not permanent visual variants:

- disabled
- loading
- focused
- pressed

## Avoid Prop Explosion

Avoid APIs such as:

isRound
isGlow
isBlue
isLargeText
hasShadow
noPadding
extraBorder

When many styling booleans appear, reconsider the component boundary or variant system.

## Composition

Prefer composition when component content varies substantially.

Do not create one giant component with dozens of conditional regions.

## Visual Consistency

Reusable components should consume shared:

- tokens
- typography
- spacing
- motion conventions
- accessibility behavior

## Escape Hatches

Allow special composition when genuinely needed.

Do not force every one-off marketing section into generic product components.
