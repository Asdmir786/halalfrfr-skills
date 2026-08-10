---
name: creative-direction
description: Art direction for new or substantially reimagined frontend experiences. Use when a site, landing page, dashboard, or product surface needs a distinctive visual concept, hierarchy, and composition.
---

# Creative Direction

Create a clear visual idea before decorating or implementing the interface.

This skill owns:

- visual concept
- art direction
- composition
- visual hierarchy
- typography direction
- color direction
- spatial rhythm
- depth
- imagery direction
- visual storytelling
- interaction mood
- overall memorability

This skill does not own:

- React architecture
- component implementation
- state management
- accessibility implementation
- performance optimization
- GSAP implementation details
- WebGL implementation details
- test automation

Route those concerns to their specialist skills.

## Core Principle

A premium interface should have a recognizable visual idea.

Do not confuse:

more effects
with
better design.

Do not confuse:

more components
with
better composition.

Do not confuse:

3D
with
premium.

The design should feel intentional even if all effects are removed.

## First Decision: What Kind of Interface Is This?

Determine the dominant interface type.

### Marketing or brand experience

Examples:

- landing page
- product launch
- company website
- portfolio
- campaign
- product showcase

Prioritize:

- narrative
- visual identity
- memorability
- emotional response
- pacing
- hierarchy
- strong hero composition
- visual storytelling

### Product or application interface

Examples:

- SaaS
- dashboard
- admin interface
- settings
- workflow
- operational system
- account area

Prioritize:

- clarity
- task hierarchy
- information architecture
- interaction confidence
- density control
- consistency
- readable state
- predictable behavior

Product interfaces may still be beautiful.

Beauty must not compete with task completion.

### Hybrid

Some products require both.

Examples:

- premium SaaS homepage with interactive product demo
- commerce experience
- hospitality experience
- financial product onboarding

Separate expressive surfaces from task-heavy surfaces rather than forcing one visual treatment everywhere.

## Existing Project vs New Project

### New project

Establish:

1. visual thesis
2. audience
3. desired emotional response
4. dominant visual device
5. typography direction
6. color behavior
7. composition system
8. imagery or asset direction
9. motion role
10. depth or 3D role

Do this before filling the page with components.

### Existing project

Inspect before changing.

Determine:

- current visual language
- existing design tokens
- recurring components
- established typography
- brand constraints
- intentional patterns
- weak patterns
- inconsistent patterns
- functional constraints

Preserve what is already strong.

Do not accidentally rebrand the product.

Do not rewrite the visual language when the user asked only for an improvement.

For substantial redesign work, coordinate with:

redesign-existing-projects

## Build a Visual Thesis

Reduce the direction to one clear sentence.

Examples of the form:

- precise industrial technology presented with editorial restraint
- warm hospitality with quiet digital sophistication
- high-performance infrastructure expressed through engineered depth
- playful consumer product with tactile dimensional motion
- financial software with calm authority and dense clarity

The sentence should communicate character rather than trendy adjectives.

Avoid empty directions such as:

- modern
- clean
- sleek
- premium
- futuristic
- beautiful

Those words are too broad without a visual mechanism.

## Define the Dominant Visual Device

Choose what gives the experience its identity.

Possible devices include:

- typography
- photography
- product renders
- editorial composition
- illustration
- dimensional layering
- architectural grids
- spatial transitions
- material texture
- data visualization
- controlled 3D
- cinematic video
- iconography
- extreme scale contrast
- interactive product demonstration

Usually one or two devices should dominate.

Do not make every design technique equally loud.

## Composition

Use composition to create hierarchy before adding effects.

Consider:

- alignment
- asymmetry
- balance
- focal point
- negative space
- overlap
- scale contrast
- density
- section rhythm
- visual anchors
- directional flow

A page should not feel like unrelated rectangles stacked vertically.

Sections may differ in composition while still belonging to one visual system.

Read:

references/composition-and-hierarchy.md

## Typography

Typography is structural.

Determine:

- display behavior
- body behavior
- scale contrast
- line length
- weight contrast
- tracking
- line height
- numeric treatment
- uppercase usage
- editorial versus functional behavior

Do not rely on a large heading alone to create hierarchy.

Avoid excessive text wrapping caused by narrow arbitrary containers.

Avoid using many font families merely to create variety.

Read:

references/composition-and-hierarchy.md

## Color

Color should have a job.

Use color to support:

- hierarchy
- brand recognition
- interaction state
- emphasis
- spatial separation
- emotional character

Do not generate arbitrary gradient-heavy palettes by default.

Do not use a large number of accent colors unless the information architecture requires them.

Respect existing brand colors when they exist.

## Depth

Depth may come from:

- overlap
- scale
- perspective
- lighting
- shadows
- foreground and background separation
- image composition
- motion
- material treatment
- video
- 3D

Choose the least complicated method that creates the required effect.

If real 3D is justified, route to:

web-3d

If motion is central, route to:

advanced-motion

## Asset Direction

Determine whether the visual concept needs:

- photography
- illustration
- product renders
- transparent assets
- textures
- video
- SVG
- generated imagery
- diagrams
- 3D models
- environment imagery

If assets materially determine the design, route to:

asset-direction

Do not build a weak CSS substitute merely because no suitable asset currently exists.

## Resource Research

External references can be valuable when:

- the domain is unfamiliar
- product-flow evidence is useful
- a specific component pattern is required
- art direction needs broader reference
- motion or 3D implementation options need research

When external resource selection is useful, route to:

frontend-resource-intelligence

Do not browse inspiration merely to imitate current trends.

## Anti-Generic Design Rule

Do not default automatically to:

- centered hero with gradient object
- two CTA buttons under every heading
- repeated three-column feature cards
- endless rounded cards
- unnecessary glassmorphism
- decorative bento grids
- floating dashboard screenshot behind the hero
- blue-purple AI gradients
- pill badges everywhere
- glowing borders everywhere
- arbitrary blobs
- random gradients
- excessive background grids
- every section using the same structure

These patterns are not forbidden.

They require conceptual justification.

A bento layout is appropriate when modular information genuinely benefits from it.

Glass is appropriate when transparency and layering support the visual system.

A centered hero is appropriate when symmetry strengthens the concept.

Do not avoid common patterns merely to appear original.

Use them when they are the correct solution.

Read:

references/anti-generic-design.md

## Avoid Forced Originality

Distinctive does not mean strange.

Do not introduce:

- random asymmetry
- unusable navigation
- illegible typography
- excessive animation
- decorative complexity
- unexpected interaction with no benefit
- novelty that harms comprehension

Originality should come from coherent decisions, not arbitrary difference.

## Visual Rhythm

Avoid identical pacing through the entire page.

Control variation through:

- section height
- density
- image scale
- type scale
- whitespace
- transition intensity
- composition
- color fields
- media

Create moments of:

- compression
- expansion
- emphasis
- calm
- reveal

A strong page has rhythm rather than repetition.

## Motion Direction

Before choosing an animation library, decide the motion language.

Possible motion character:

- precise
- mechanical
- soft
- elastic
- cinematic
- restrained
- immediate
- playful
- spatial
- editorial

Motion should reinforce the product character.

Do not animate every visible object.

When implementation requires complex choreography, route to:

advanced-motion

## 3D Decision

Ask:

Does spatial interaction materially improve the idea?

Use real 3D when it helps communicate:

- physical product form
- spatial systems
- depth
- simulation
- transformation
- immersive storytelling
- physically meaningful interaction

Do not use real 3D merely because it looks technically impressive.

Possible progression:

- layered 2D
- perspective transforms
- rendered imagery
- rendered video
- shader effect
- lightweight WebGL
- Three.js or React Three Fiber

Choose based on the concept.

## Responsive Direction

Do not assume desktop composition should simply shrink.

Identify what must remain dominant at:

- wide desktop
- laptop
- tablet
- mobile

The responsive skill should reinterpret composition while preserving the visual thesis.

Route to:

responsive-composition

## Design-System Handoff

After the direction is established, convert visual choices into reusable rules.

Route to:

design-system-web

The art direction should eventually become:

- typography rules
- color rules
- spacing behavior
- surface rules
- radii
- border treatment
- elevation
- interaction language
- component variants
- motion language

Do not leave important visual decisions as isolated arbitrary values.

## Implementation Handoff

The visual direction should be implementable without turning the codebase into a one-off art project.

For production implementation, coordinate with:

frontend-architecture
frontend-ui-engineering

The engineering layer may simplify implementation details while preserving the visual intent.

## Final Creative Review

Before handing off the direction, ask:

1. Can the visual idea be explained in one sentence?
2. Is there a clear focal point?
3. Is the hierarchy understandable without animation?
4. Does the design fit the product and audience?
5. Does the typography have character and discipline?
6. Is color doing useful work?
7. Is depth intentional?
8. Are assets supporting the concept?
9. Does motion have a role?
10. Is 3D justified if present?
11. Is the design recognizably different from generic AI output?
12. Is it still usable?
13. Can the visual system survive multiple pages?
14. Can engineering implement it cleanly?

If the answer to several of these is no, refine the direction before implementation.

## Supporting References

Read when deeper guidance is useful:

references/art-direction-framework.md
references/composition-and-hierarchy.md
references/anti-generic-design.md
references/handoff-contract.md

