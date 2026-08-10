---
name: frontend-performance
description: Frontend performance diagnosis and optimization for Core Web Vitals, loading, interaction latency, bundles, hydration, rendering, media, animation, and WebGL.
---

# Frontend Performance

Improve real user experience without sacrificing the product unnecessarily.

This skill owns:

- loading performance
- interaction responsiveness
- layout stability
- Core Web Vitals
- JavaScript cost
- bundle cost
- hydration cost
- rendering cost
- asset loading
- font loading
- image loading
- video loading
- animation performance
- WebGL performance coordination
- performance measurement
- performance regression review

This skill does not own:

- general art direction
- broad frontend architecture
- asset art direction
- motion choreography
- 3D visual direction
- accessibility auditing
- generic code cleanup

Use specialist skills for those concerns.

## Core Principle

Measure first when possible.

Optimize the bottleneck that materially affects the user.

Do not flatten a visually strong experience merely because one expensive technique exists.

Do not keep an expensive technique merely because it looks impressive.

## Current Core Web Vitals

Use the current official metric definitions and tooling.

At the time this skill was authored, the Core Web Vitals are:

- Largest Contentful Paint
- Interaction to Next Paint
- Cumulative Layout Shift

These measure important aspects of:

- loading
- responsiveness
- visual stability

Metric definitions and tooling can evolve.

When exact thresholds, APIs, scoring behavior, or current recommendations matter, verify current official documentation.

Read:

references/metrics-and-measurement.md

## Existing Project First

Inspect:

- framework
- rendering model
- build system
- package manager
- bundle analyzer if present
- image strategy
- font strategy
- route structure
- caching strategy
- data-fetching approach
- animation libraries
- third-party scripts
- analytics
- WebGL
- video
- large assets
- existing performance tooling

Do not introduce tooling blindly.

Use existing scripts and observability when available.

## Performance Categories

Distinguish between:

### Loading

How quickly meaningful content becomes available.

### Responsiveness

How quickly the interface responds to interaction.

### Stability

Whether content shifts unexpectedly.

### Runtime

How efficiently the interface continues to render and react.

### Network

How much data is transferred and how efficiently.

### Memory and GPU

Especially relevant for:

- animation-heavy pages
- canvas
- WebGL
- video
- large visual experiences

## LCP

Investigate the actual Largest Contentful Paint element.

Common causes may include:

- slow server response
- render-blocking work
- late image discovery
- unnecessarily large hero media
- client-only rendering of critical content
- font delay
- excessive JavaScript before useful content

Do not optimize an unrelated image merely because it is large.

Find the actual critical element.

## INP

Interaction responsiveness can be affected by:

- long main-thread tasks
- large synchronous JavaScript work
- heavy event handlers
- excessive rendering
- expensive state updates
- third-party scripts
- hydration work
- complex layout or paint

Do not reduce animation durations and call that an INP fix without finding the actual interaction delay.

## CLS

Protect layout stability.

Common causes may include:

- images without reserved dimensions
- async content inserted above existing content
- font changes
- banners
- ads
- late-loading UI
- unstable skeletons
- layout-changing animation

Reserve space intentionally.

Do not hide useful dynamic content merely to avoid layout shifts.

## Field vs Lab Data

Distinguish:

### Field data

Real-user measurements.

Useful for understanding production experience.

### Lab data

Controlled testing.

Useful for diagnosis and repeatability.

Do not assume one Lighthouse run represents every user's experience.

Use both when available.

## JavaScript Budget

Inspect:

- initial JavaScript
- route-specific JavaScript
- duplicated dependencies
- client-only libraries
- animation libraries
- visualization libraries
- date libraries
- editor libraries
- third-party SDKs

Do not remove useful dependencies merely because they contribute bytes.

Evaluate actual value and loading strategy.

## Client Boundaries

In frameworks with server and client component boundaries, unnecessary client rendering can increase:

- JavaScript
- hydration
- runtime work

Keep interactive boundaries intentional.

Coordinate structural decisions with:

frontend-architecture

Do not force framework-specific rendering strategies onto unrelated stacks.

## Code Splitting

Lazy loading can be valuable for:

- below-fold visual features
- heavy editors
- charts
- maps
- WebGL
- optional modals
- rarely used workflows

Do not lazy-load tiny components merely to increase the number of chunks.

Consider user timing and network waterfalls.

## Images

Inspect:

- intrinsic dimensions
- responsive sizing
- source resolution
- format
- compression
- priority
- lazy loading
- crop
- LCP role

Do not serve a huge desktop asset to a narrow mobile display when a responsive alternative is practical.

Coordinate visual requirements with:

asset-direction

Read:

references/loading-and-assets.md

## Fonts

Font strategy should balance:

- visual identity
- file size
- number of weights
- subsets
- loading behavior
- fallback behavior
- layout stability

Avoid loading many unused weights.

Do not destroy a distinctive type system merely to save a trivial amount of data.

Optimize intelligently.

## Video

Video can be one of the heaviest frontend assets.

Consider:

- codec
- bitrate
- resolution
- poster image
- preload behavior
- autoplay
- mobile behavior
- looping
- visibility
- lazy loading

A decorative video should not block essential page content.

## Third-Party Scripts

Audit:

- analytics
- chat widgets
- advertising
- experimentation
- embeds
- support tools
- social widgets

Third-party JavaScript may compete for main-thread and network resources.

Do not remove required business tooling without understanding why it exists.

## Rendering

Watch for:

- unnecessary re-renders
- expensive derived calculations
- large frequently changing trees
- unstable object creation where it materially matters
- synchronous heavy work during interactions
- giant client-rendered sections

Do not perform micro-optimizations without evidence.

Read:

references/runtime-and-rendering.md

## React Performance

Start with correct component and state architecture.

Do not add memoization everywhere automatically.

Use memoization when:

- work is meaningfully expensive
- referential stability matters
- profiling indicates value
- library integration requires it

Unnecessary memoization can increase complexity without improving user experience.

## Animation

Coordinate with:

advanced-motion

Inspect:

- layout-triggering animation
- large blur
- filters
- many simultaneous layers
- scroll-linked work
- long-running effects

Prefer compositor-friendly animation when practical.

Do not remove meaningful motion until simpler optimizations have been considered.

## WebGL

Coordinate with:

web-3d

Possible performance controls include:

- DPR
- texture resolution
- geometry
- draw calls
- lights
- shadows
- effects
- loading
- fallback strategy

Do not evaluate WebGL performance using only desktop hardware.

## CSS

Potential expensive patterns include:

- very large blur regions
- excessive backdrop filtering
- large complex shadows
- huge paint areas
- frequently changing layout properties

Do not ban these techniques globally.

Use them where their visual value justifies the cost.

## DOM Size

Very large DOM trees can increase:

- style calculation
- layout
- memory
- update cost

Do not create wrapper elements unnecessarily.

Do not flatten semantic structure merely to reduce node count.

## Virtualization

Use virtualization for genuinely large collections where rendering all items is costly.

Do not virtualize small lists automatically.

Consider:

- accessibility
- search
- browser find
- dynamic heights
- keyboard interaction

## Performance Budgets

A project may define budgets for:

- JavaScript
- images
- route weight
- WebGL assets
- video
- fonts
- Core Web Vitals

Budgets should reflect product context.

A visually rich product launch page and a transactional dashboard may have different acceptable tradeoffs.

## Workflow

Use:

1. observe
2. reproduce
3. measure
4. identify bottleneck
5. form hypothesis
6. make smallest useful change
7. measure again
8. check visual and functional regressions

Read:

references/performance-workflow.md

## Do Not Optimize Blindly

Avoid cargo-cult changes such as:

- converting every component to server rendering
- memoizing everything
- lazy-loading everything
- removing every animation
- replacing every image
- reducing all quality
- deleting every dependency

Performance is contextual.

## Resource Intelligence

For current tooling and library-specific recommendations route to:

frontend-resource-intelligence

When current browser behavior or metric definitions matter, verify official documentation.

## Final Review

Check:

1. What is the actual bottleneck?
2. Is the issue loading, responsiveness, stability, runtime, network, or GPU?
3. Was field data considered when available?
4. Was critical content prioritized?
5. Are heavy assets justified?
6. Is JavaScript loading appropriate?
7. Are client boundaries intentional?
8. Are images correctly delivered?
9. Are fonts controlled?
10. Are third-party scripts understood?
11. Are animations efficient?
12. Is WebGL device-aware?
13. Did the optimization preserve the visual thesis?
14. Was improvement measured after the change?

## Supporting References

references/metrics-and-measurement.md
references/loading-and-assets.md
references/runtime-and-rendering.md
references/performance-workflow.md

