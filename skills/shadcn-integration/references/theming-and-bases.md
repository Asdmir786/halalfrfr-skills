# Theming and Component Bases

## Base Awareness

Modern shadcn projects may use different component bases.

Always inspect imports and project configuration.

Do not assume one base universally.

## Theme

Preserve project semantic variables.

Coordinate larger theme work with:

design-system-web

## Composition

Different component bases may have different:

- APIs
- state attributes
- composition patterns
- keyboard behavior
- portal behavior

Inspect the installed implementation.

## Styling

Style the component to match the product.

Do not preserve demo styling merely because it shipped with the component.

## Upgrades

When upstream structure changes, compare it with local modifications before applying updates.

## Principle

shadcn distributes implementation.

The project's design system determines appearance.
