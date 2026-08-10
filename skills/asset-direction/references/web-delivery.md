# Web Asset Delivery

Asset quality must be balanced against loading cost.

## Images

Consider:

- responsive sources
- intrinsic dimensions
- modern formats
- lazy loading below the fold
- preload only for truly critical imagery
- correct quality settings

Do not preload large numbers of visual assets.

## Hero Media

Hero media may justify higher priority.

Still avoid delaying meaningful page rendering unnecessarily.

## Video

Provide:

- compressed output
- poster frame
- sensible autoplay behavior
- muted playback when autoplaying
- mobile consideration
- fallback when useful

## 3D

Consider:

- model compression
- Draco or Meshopt where appropriate
- texture compression
- lower-detail mobile strategy
- lazy loading
- fallback imagery

## Fonts

Fonts are also visual assets.

Avoid excessive families, weights, and unused subsets.

Coordinate detailed optimization with:

frontend-performance
