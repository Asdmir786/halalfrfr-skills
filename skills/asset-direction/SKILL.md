---
name: asset-direction
description: Asset strategy for frontend photography, renders, video, SVG, transparent imagery, generated media, and 3D assets. Use when visual media materially determines the interface.
---

# Asset Direction

Choose and specify the visual media needed to make the interface convincing.

This skill owns:

- asset strategy
- photography direction
- image direction
- illustration direction
- product render direction
- transparent asset direction
- texture direction
- video direction
- SVG direction
- diagram direction
- generated imagery direction
- 3D asset requirements
- responsive crop strategy
- asset delivery requirements

This skill does not own:

- page architecture
- React architecture
- final motion implementation
- Three.js scene implementation
- browser QA
- general design-system tokens

## Core Principle

Do not force CSS to imitate an asset that should actually exist.

Also do not generate media when CSS, typography, or simple graphics already communicate the idea better.

Choose the correct medium.

## Inspect Existing Assets First

Before requesting or generating new media, inspect:

- public assets
- image folders
- product screenshots
- logos
- illustrations
- SVG files
- videos
- 3D models
- brand photography
- icon systems
- existing CDN assets

Reuse suitable assets when they support the visual direction.

Do not create near-duplicates unnecessarily.

## Asset Decision

For each important visual moment ask:

What information or feeling must this visual communicate?

Then choose the medium.

Possible media:

- typography
- CSS composition
- SVG
- illustration
- photography
- product screenshot
- product render
- transparent image
- video
- image sequence
- shader
- 3D model

Read:

references/asset-decision-matrix.md

## Photography

Specify:

- subject
- environment
- framing
- perspective
- lighting
- depth of field
- orientation
- negative space
- emotional tone
- crop requirements

Do not use generic stock photography if product-specific imagery is important to credibility.

## Product Imagery

For physical products consider:

- hero angle
- macro details
- exploded views
- material detail
- scale
- use context
- isolated transparent views
- shadow behavior
- reflections

A product page often benefits more from excellent product imagery than from unnecessary real-time 3D.

## Product UI Imagery

For software products prefer:

- real interface
- believable product states
- real workflows
- meaningful data structure

Avoid fake generic dashboards that do not correspond to the product.

If the product interface itself needs implementation from a visual reference, route to:

visual-reference-to-code

## Generated Imagery

AI-generated imagery may be useful for:

- conceptual scenes
- backgrounds
- product mood
- editorial illustration
- textures
- campaign visuals
- supporting environmental imagery

Generated imagery must still match:

- brand
- lighting
- perspective
- composition
- subject consistency
- page color system

Do not scatter unrelated generated images across a page.

## Transparent Assets

Transparent PNG or WebP assets can be effective for:

- product cutouts
- layered hero compositions
- overlapping objects
- parallax
- depth

Ensure edge quality and realistic shadow treatment.

## SVG

Prefer SVG for:

- icons
- diagrams
- simple illustrations
- logos when authorized
- geometric graphics
- lightweight scalable visuals

Do not convert complex photographic material into oversized SVG paths.

## Video

Use video when movement itself is important.

Examples:

- product transformation
- cinematic environment
- manufacturing process
- spatial transition
- rendered product sequence

Video can sometimes create a stronger high-end experience than expensive real-time 3D.

Consider:

- autoplay behavior
- muted playback
- poster frame
- loop point
- compression
- mobile fallback
- reduced-motion behavior

## Image Sequences

Image sequences may be useful for:

- scroll-driven product rotation
- product assembly
- cinematic transitions

Consider their download cost carefully.

Use only when the experience justifies the weight.

## 3D Assets

When real-time 3D is justified, define:

- model format
- polygon complexity
- texture resolution
- material requirements
- animation clips
- lighting expectations
- camera expectations
- interaction requirements
- fallback asset

For web implementation route to:

web-3d

## Asset Consistency

Assets across one experience should feel related.

Maintain consistency in:

- lighting
- color grade
- perspective
- material character
- realism
- illustration language
- shadow behavior
- crop style

## Responsive Art Direction

Desktop and mobile may require different crops.

Do not assume one landscape image should simply shrink.

Define:

- desktop crop
- tablet crop
- mobile crop
- focal point
- safe text region

When composition changes substantially, coordinate with:

responsive-composition

## Performance

Choose delivery formats appropriately.

Common choices include:

- AVIF
- WebP
- optimized JPEG
- SVG
- compressed video
- GLB or GLTF

The exact choice depends on browser support, framework behavior, asset type, and quality requirements.

Coordinate heavy assets with:

frontend-performance

## Rights and Provenance

For public or commercial projects, know whether an asset is:

- user-owned
- company-owned
- licensed
- generated
- open-source
- stock
- third-party reference only

Do not redistribute third-party assets merely because they are accessible online.

Record attribution requirements where needed.

## Resource Intelligence

When external asset libraries, inspiration, 3D tools, typography resources, or media tools are useful, route to:

frontend-resource-intelligence

## Asset Brief

For every important new asset, create a concise brief.

Include:

- purpose
- subject
- composition
- visual style
- lighting
- perspective
- color behavior
- output format
- target aspect ratio
- transparency requirement
- responsive needs
- animation needs
- technical constraints

Read:

references/asset-brief-template.md

## Asset Acceptance Test

Before integrating an asset, verify:

1. Does it strengthen the visual thesis?
2. Is it product-specific enough?
3. Does it match the other media?
4. Does it have sufficient resolution?
5. Is the crop usable responsively?
6. Is transparency clean if required?
7. Is the file weight reasonable?
8. Are rights or provenance understood?
9. Does it still work without animation?
10. Is there a fallback where necessary?

## Supporting References

references/asset-decision-matrix.md
references/asset-brief-template.md
references/web-delivery.md

