# Web 3D Performance Budget

Performance is affected by the entire scene, not one metric.

## Geometry

Inspect:

- polygon count
- repeated geometry
- invisible geometry
- draw calls

## Textures

Inspect:

- resolution
- number of textures
- memory use
- compression

## Rendering

Inspect:

- DPR
- canvas dimensions
- alpha
- shadows
- antialiasing strategy
- post-processing

## Scene

Inspect:

- dynamic lights
- particles
- transparent layers
- expensive materials
- frame-loop calculations

## Mobile

Consider a lower-quality mode.

Possible reductions:

- DPR
- particles
- shadows
- post-processing
- model detail
- texture detail

## Principle

Optimize the expensive thing that actually matters.

Do not reduce visual quality everywhere before identifying the real bottleneck.
