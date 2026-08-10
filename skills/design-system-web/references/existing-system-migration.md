# Existing System Migration

Do not begin by replacing the current design system.

## Audit

Inspect:

- CSS variables
- Tailwind configuration
- utility classes
- shared components
- component variants
- typography
- theme providers
- repeated raw values

## Classify

For each current pattern decide:

- keep
- normalize
- merge
- deprecate
- replace

## Preserve Stable APIs

If a component API is already widely used and reasonable, preserve it when possible.

Improve internals before causing unnecessary call-site churn.

## Normalize Gradually

Prioritize:

1. shared primitives
2. frequently reused components
3. global typography
4. global colors
5. spacing inconsistencies
6. one-off surfaces

## Avoid Visual Regression

After system changes, route to:

visual-qa

for browser-based comparison.
