# Component Quality

## Responsibility

A component should have an understandable job.

## API

Props should expose meaningful concepts rather than internal styling fragments.

## State

Own local interaction state locally.

Avoid duplicated state.

## Rendering

Keep render logic predictable and free of external mutation.

## Styling

Consume established tokens and variants.

Do not create a separate visual language inside one component without a deliberate reason.

## Semantics

Use the correct underlying element for the interaction.

## Composition

Prefer composition when content structure needs flexibility.

## Reuse

Reuse stable contracts, not accidental visual resemblance.

## Escape Hatches

Highly art-directed marketing components may remain specialized.

Do not force them into generic product-component abstractions.

## Maintenance Test

Ask:

Can someone understand how to modify this component without reading unrelated parts of the application?

If not, the boundary may be wrong.
