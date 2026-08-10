# Loading and Fallbacks

## Loading

A user should understand that visual content is being prepared.

Possible loading states:

- poster image
- static render
- progress
- staged reveal
- lightweight placeholder

## Lazy Loading

Below-fold 3D experiences should normally not compete with critical first-render content unless the product requires immediate loading.

## Fallback

A fallback may use:

- image
- video
- simplified WebGL
- DOM composition

## Decorative 3D

Decorative scenes are the easiest candidates for static fallback.

## Essential 3D

If 3D communicates essential product information, provide an accessible alternative representation.

## Failure

Do not let a failed model or texture request collapse the entire page.

Contain failure within the visual feature where possible.
