# Loading and Assets

## Critical Content

Prioritize assets required for the first meaningful viewport.

Do not preload everything.

## Images

Inspect:

- dimensions
- responsive source
- format
- compression
- priority
- lazy loading
- LCP role

## Fonts

Inspect:

- families
- weights
- subsets
- fallback
- loading strategy

## Video

Inspect:

- poster
- preload
- codec
- resolution
- mobile behavior

## WebGL

Heavy scene assets may benefit from:

- deferred loading
- compressed geometry
- compressed textures
- static fallback

## Waterfalls

Avoid turning one large request into many sequential dependent requests without considering total loading time.

## Principle

Deliver the right asset, at the right quality, when it is actually needed.
