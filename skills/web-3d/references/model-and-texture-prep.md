# Model and Texture Preparation

## Model

Inspect:

- polygon count
- hierarchy
- pivot
- scale
- orientation
- material slots
- animation clips

## Remove

When safe:

- hidden geometry
- unused objects
- duplicate materials
- unused animations

## Preserve

Keep separate meshes when required for:

- selection
- configuration
- animation
- material changes

## Textures

Use resolution appropriate to actual on-screen size.

A texture authored for offline rendering may be unnecessarily large for the web.

## Compression

Geometry and texture compression can reduce payload significantly.

Choose current project-compatible tooling and verify current library documentation before configuring decoders or loaders.

## Naming

Useful names for meshes, materials, and clips make later AI-assisted modification much easier.

Avoid meaningless exported names when the asset pipeline allows cleanup.
