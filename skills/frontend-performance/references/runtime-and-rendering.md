# Runtime and Rendering

## Main Thread

Investigate:

- long tasks
- expensive handlers
- large synchronous calculations
- third-party scripts
- excessive rendering

## React

Prefer correct state ownership before adding optimization APIs.

Avoid unnecessary duplicated state.

## Memoization

Use when it has a measurable or architectural purpose.

Do not memoize every component automatically.

## Effects

Effects should not become a general data-flow mechanism.

Unnecessary effect chains can create repeated rendering and difficult synchronization.

## DOM

Keep structure semantic and understandable.

Avoid enormous trees created by unnecessary wrappers or duplicated hidden interfaces.

## Animation

High-frequency animation should minimize layout and paint work when practical.

## Principle

Optimize expensive repeated work before polishing insignificant one-time operations.
