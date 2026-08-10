# Motion Performance

## Prefer

When appropriate:

- transform
- opacity
- bounded animation regions
- scoped timelines
- cleanup after unmount
- lazy initialization for below-fold experiences

## Inspect Carefully

- layout-changing animation
- large blur animation
- backdrop-filter
- many box shadows
- multiple full-screen layers
- large image sequences
- high-frequency scroll calculations
- animation of large SVG path sets
- continuous background effects

## Scroll

Avoid doing expensive work for every scroll event when the animation system can manage progress efficiently.

## Mobile

Mobile hardware and thermal constraints matter.

Simplify when the visual gain is smaller than the performance cost.

## Measurement

Do not guess indefinitely.

Use browser performance tools and real-device testing when performance is important.

Coordinate broader work with:

frontend-performance
