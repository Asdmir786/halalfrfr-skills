# Frontend Architecture Principles

## Responsibility Before Size

A component boundary should represent responsibility, not a line-count target.

Split when responsibilities diverge.

Keep together when understanding the behavior requires reading both pieces together.

## Local Before Shared

Start feature-specific code locally.

Promote code to shared only after its reusable contract becomes clear.

## Stable Public APIs

Shared components should expose small meaningful APIs.

Internal implementation may change without requiring widespread call-site changes.

## Composition

Composition is often preferable to very large configuration objects.

Use children, slots, or framework-appropriate composition when the structure genuinely varies.

## Dependency Direction

Keep lower-level layers independent of feature-specific layers.

Avoid circular relationships.

## Visual Exceptions

Special marketing or creative sections may justify custom local structure.

Do not turn one exceptional visual treatment into a global abstraction prematurely.

## Predictability

Boring architecture is often good architecture.

Choose patterns developers can recognize and modify confidently.

## Deletion Test

A useful architectural question:

If this feature were deleted, how much unrelated code would need to change?

Strong feature isolation usually makes the answer small.
