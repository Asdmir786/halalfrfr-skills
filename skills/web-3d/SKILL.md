---
name: web-3d
description: Real-time web 3D and WebGL using project-appropriate Three.js, React Three Fiber, shaders, models, cameras, lighting, interaction, and performance strategies. Use only when spatial rendering adds real value.
---

# Web 3D

Use real-time 3D when spatial rendering produces meaningful value.

This skill owns:

- Three.js-oriented rendering
- React Three Fiber integration
- Drei-style helpers when appropriate
- WebGL scene architecture
- GLTF and GLB integration
- camera behavior
- lighting
- materials
- shaders
- real-time interaction
- scene animation
- model-loading strategy
- 3D responsiveness
- 3D performance strategy
- fallback strategy

This skill does not own:

- general art direction
- ordinary DOM motion
- generic React architecture
- asset-generation strategy
- complete frontend performance auditing
- final visual QA

Coordinate those concerns with specialist skills.

## Core Principle

3D must solve a visual or interaction problem.

Strong reasons include:

- physical product exploration
- spatial relationship
- interactive object manipulation
- simulation
- real depth
- shader-driven experience
- immersive narrative
- technical visualization

Weak reason:

It looks advanced.

## 3D Decision Gate

Before creating a WebGL scene ask:

Can the intended experience be achieved more effectively with:

- photography
- transparent render
- video
- image sequence
- CSS perspective
- layered DOM
- shader-only background

If yes, consider the simpler medium.

Coordinate medium choice with:

asset-direction

## Existing Project First

Inspect:

- whether Three.js is installed
- whether React Three Fiber is installed
- whether helper libraries exist
- current renderer architecture
- scene components
- model loaders
- asset paths
- post-processing stack
- performance utilities
- existing Canvas or WebGL roots
- state management
- animation integration
- client boundaries
- fallback behavior

Do not introduce a second 3D architecture casually.

## Stack Selection

For React projects, React Three Fiber may provide the most natural integration when the project already follows React composition.

Direct Three.js may be appropriate when:

- the project is not React-based
- low-level control is required
- existing architecture already uses direct Three.js
- a small isolated scene does not benefit from React integration

A lightweight WebGL library may be better for very small shader-driven experiences.

Do not choose technology from habit.

## Version Awareness

3D libraries evolve.

Before using:

- loader options
- renderer options
- helper APIs
- post-processing packages
- decoder configuration
- shader APIs

inspect installed versions and current official documentation.

Do not encode assumptions from an unrelated version.

## Scene Architecture

Separate major responsibilities.

A scene may conceptually contain:

- renderer or Canvas boundary
- camera
- lighting
- environment
- product or world objects
- interaction
- animation
- post-processing
- loading state
- fallback

Do not place the entire 3D experience into one giant scene component.

Also do not fragment every mesh into unnecessary abstraction.

Read:

references/scene-architecture.md

## React Integration

When using React Three Fiber:

- keep scene concerns inside a coherent scene boundary
- avoid unnecessary React state updates every rendered frame
- separate DOM UI from scene objects when appropriate
- keep expensive transient animation out of ordinary application state when it does not need to trigger React rendering

Use the project's established patterns.

## Next.js Integration

A real-time browser WebGL scene requires client-side execution.

In a Next.js App Router project:

- isolate the client-rendered 3D boundary
- avoid moving unrelated page content into the client subtree
- consider lazy loading for non-critical scenes
- preserve meaningful server-rendered content around the experience

Coordinate architecture with:

frontend-architecture

## Models

Common web model formats include GLTF and GLB.

Before integrating a model inspect:

- polygon count
- material count
- texture count
- texture resolution
- animation clips
- scale
- pivot
- orientation
- bounding volume

Do not assume source models are web-ready.

## Model Preparation

Possible preparation includes:

- reducing geometry
- combining meshes where appropriate
- preserving separable meshes needed for interaction
- compressing geometry
- compressing textures
- removing unused materials
- removing invisible geometry
- correcting scale and pivot
- baking lighting where appropriate

Do not optimize in ways that break required interaction.

## Texture Strategy

Texture cost can dominate a scene.

Inspect:

- dimensions
- number of textures
- channel usage
- color-space requirements
- normal maps
- roughness and metalness
- alpha
- environment maps

Do not ship unnecessarily large textures merely because the source artwork is high resolution.

Coordinate broader asset strategy with:

asset-direction

## Lighting

Lighting should support the visual thesis.

Possible strategies:

- environment-driven
- studio product lighting
- directional
- ambient
- baked
- mixed

Avoid adding many dynamic lights merely to brighten the scene.

Dynamic shadows can be expensive.

Use them only when their visual contribution justifies them.

## Materials

Material choice should communicate the object correctly.

Consider:

- roughness
- metalness
- transparency
- transmission
- emissive behavior
- normal detail
- environment reflection

Highly transparent or refractive materials may carry significant performance cost.

Do not use physically complex materials on every object.

## Camera

Camera behavior is part of composition.

Define:

- framing
- focal length or perspective character
- near and far ranges
- target
- interaction limits
- responsive framing

Do not treat the camera as an implementation afterthought.

A beautiful model with weak framing still produces weak design.

## Responsive Camera

Desktop and mobile may need different:

- camera distance
- focal point
- object position
- field of view
- interaction range

Do not simply shrink the Canvas.

Coordinate layout behavior with:

responsive-composition

## Interaction

Possible interactions include:

- orbit
- drag
- hover
- pointer tracking
- click selection
- scroll-linked movement
- product configuration

Interaction must have a product purpose.

Do not make an object constantly chase the pointer unless it contributes to the experience.

Important actions must not rely solely on hover.

## Animation

Scene animation may come from:

- model animation clips
- procedural animation
- timeline-driven animation
- scroll progress
- physics
- shader time
- user interaction

Use the simplest mechanism that fits.

For broader DOM or scroll choreography coordinate with:

advanced-motion

## Render Loop

Be cautious about work performed every frame.

Avoid unnecessary:

- allocations
- React state updates
- geometry creation
- material creation
- expensive calculations

Move static setup outside high-frequency paths.

## Instancing

When many objects share geometry and material, an instancing strategy may substantially reduce draw overhead.

Use when the scene actually contains repeated objects.

Do not introduce instancing when object count is small and clarity would suffer.

## Level of Detail

Large scenes may benefit from different detail levels based on distance or device capability.

Do not create LOD complexity for a small hero object.

## Shadows

Shadows may be:

- real-time
- baked
- blob or contact approximation
- omitted

Choose according to visual need and cost.

For product heroes, a simple convincing ground shadow may outperform a heavy global shadow setup.

## Post-Processing

Effects may include:

- bloom
- depth of field
- color adjustment
- vignette
- distortion
- anti-aliasing strategies

Post-processing is not mandatory.

Stacking effects can significantly increase cost.

Use effects only when they strengthen the concept.

## Shaders

Custom shaders are justified for effects that ordinary materials cannot express effectively.

Examples:

- procedural gradients
- displacement
- distortion
- dissolves
- fluid fields
- custom transitions

Keep shader complexity proportionate to the experience.

Provide fallbacks where appropriate.

## Performance Budget

Treat frame rate, memory, loading, and responsiveness as product constraints.

Possible levers include:

- DPR
- polygon count
- texture resolution
- draw calls
- lights
- shadows
- post-processing
- model compression
- scene complexity
- lazy loading

Read:

references/performance-budget.md

## Device Strategy

Do not assume the same scene quality on every device.

Possible device-aware adaptations:

- lower DPR
- reduced particles
- reduced shadow quality
- simpler materials
- fewer post-processing effects
- simpler model
- static fallback

Preserve the concept while reducing cost.

## Loading

A 3D experience should communicate loading state clearly when necessary.

Possible strategies:

- poster image
- static render
- skeleton stage
- progress indicator
- staged lazy load

Do not leave a large blank region while assets load.

Read:

references/loading-and-fallbacks.md

## Fallbacks

Fallbacks are especially valuable when:

- WebGL is unavailable
- device performance is weak
- reduced motion is requested
- network conditions are poor
- the scene is decorative rather than essential

Possible fallback:

- static render
- short video
- simplified shader
- DOM composition

A fallback should preserve the page's message.

## Accessibility

3D canvas content should not become the only way to access essential information or actions without an accessible equivalent.

For product-critical information provide appropriate DOM content and controls.

Coordinate with:

frontend-accessibility

## Reduced Motion

When scene movement is primarily decorative, substantially reduce or stop it when appropriate.

If scene movement communicates information, provide a less motion-intensive equivalent.

## Cleanup

Scenes must clean up responsibly.

Inspect:

- event listeners
- timers
- animations
- controls
- loaders
- resources
- scene lifecycle

Use the project's established library lifecycle patterns.

Do not manually dispose resources in ways that conflict with framework-managed ownership.

## Visual Integration

The Canvas must belong to the page.

Match:

- color system
- lighting
- composition
- surface language
- asset direction
- section hierarchy

Do not make the 3D scene look like a separate demo embedded inside the site.

## Resource Intelligence

When selecting 3D tools, examples, helper libraries, or inspiration, coordinate with:

frontend-resource-intelligence

## Final Review

Check:

1. Is real-time 3D justified?
2. Is the scene integrated into the visual concept?
3. Is camera composition strong?
4. Are models web-ready?
5. Are textures appropriately sized?
6. Are materials intentional?
7. Are lights and shadows controlled?
8. Is frame-loop work reasonable?
9. Is responsive framing implemented?
10. Is mobile complexity appropriate?
11. Is loading communicated?
12. Is a fallback available when appropriate?
13. Is essential information accessible outside the canvas?
14. Is the scene isolated from unrelated application architecture?
15. Could a simpler medium create the same value?

If yes to the final question, reconsider whether real-time 3D is necessary.

## Supporting References

references/scene-architecture.md
references/performance-budget.md
references/loading-and-fallbacks.md
references/model-and-texture-prep.md

