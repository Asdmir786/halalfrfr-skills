# Resource Intelligence Policy

These resources are references and tools, not automatic project dependencies.

## Selection Order

For implementation work, prefer:

1. Existing project components and design system
2. Existing project primitive/base library
3. Stable accessible primitives
4. Curated component registries
5. Adapted external component patterns
6. Custom implementation when the experience requires it

Do not install multiple competing UI systems merely because they are present in this catalog.

## Resource Roles

### Core
Frequently useful and high-confidence.

### Strong
High-value specialist or secondary resource.

### Secondary
Useful when project requirements match.

### Optional
Niche or stylistic resource.

### Watch
Monitor or use for comparison rather than default implementation.

### Core Benchmark / Strong Benchmark
Use to compare output quality or workflows. Do not treat as implementation dependencies.

### Personal
User-curated reference material.

### Unresolved
Known resource name whose canonical source still needs verification.

## Inspiration Is Not Specification

Awwwards, Godly and similar galleries may guide:

- composition
- visual language
- typography
- interaction
- pacing
- art direction

They must not automatically determine:

- product information architecture
- accessibility
- business logic
- component architecture

Product UX references and evidence-based research should carry more weight for functional application design.

## External Components

Never paste an external component blindly.

Before adoption:

- inspect dependencies
- inspect accessibility
- inspect responsiveness
- inspect performance
- adapt tokens and styling
- fit it into project architecture
- remove unnecessary dependencies
- preserve the project's visual language

## Motion

Default progression:

simple CSS
→ Motion
→ GSAP
→ WebGL / Three.js

Move upward only when the experience benefits from the additional complexity.

## 3D

3D is an available design medium, not a mandatory feature.

Use R3F / Three.js when spatial interaction, depth, product visualization or storytelling materially improves the experience.

Prefer simpler compositing, imagery, video or CSS when they achieve the same effect more efficiently.

## Existing Projects

Preserve established:

- design tokens
- primitives
- component APIs
- state architecture
- interaction conventions

Do not replace a working foundation solely because another library appears in this catalog.
