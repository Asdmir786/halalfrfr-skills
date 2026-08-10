# Web 3D Scene Architecture

A scene should have understandable ownership.

## Typical Responsibilities

- scene root
- camera
- lighting
- environment
- primary objects
- interaction
- animation
- effects
- loading
- fallback

## React Three Fiber

A conceptual structure may resemble:

Canvas boundary
-> Scene
-> Environment
-> Product
-> Effects

The exact structure should match the project.

## DOM and Canvas

Keep DOM UI in DOM when it benefits from:

- accessibility
- text rendering
- normal layout
- forms
- navigation

Do not render ordinary UI in WebGL merely because a Canvas exists.

## State

Use React or application state for meaningful product state.

Avoid sending high-frequency transient animation values through global React state when direct scene mutation or library-managed state is more appropriate.

## Isolation

A 3D feature should have a clear boundary.

Deleting the 3D feature should not require rewriting unrelated application architecture.
