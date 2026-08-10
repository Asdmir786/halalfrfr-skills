# State and Rendering Boundaries

## State Ownership

Place state at the lowest common owner that needs to coordinate it.

Do not lift state globally by default.

## Derived State

Prefer deriving values when possible.

Avoid synchronizing multiple state variables that represent the same fact.

## State Shape

Avoid:

- contradictions
- duplicated information
- deeply nested mutable structures
- redundant flags

Prefer models where invalid combinations are difficult to represent.

## Events

User-triggered changes normally belong in event handling logic.

Do not create effects solely to respond to something that can be handled directly from the event.

## Effects

Use effects for synchronization with systems outside normal React rendering.

Examples:

- subscriptions
- browser APIs
- imperative libraries

An effect should have a clear synchronization purpose.

## Server and Client

In frameworks that support server and client component boundaries:

use server rendering for non-interactive work when appropriate

and introduce client boundaries where client-only capabilities are required.

Keep the decision framework-aware rather than assuming every React project has the same rendering model.

## URL Ownership

Use URL state when users should be able to:

- share it
- bookmark it
- navigate backward and forward through it
- reload and retain it

## Global State

Use global client state when there is genuine shared client ownership.

Do not create global state only to avoid straightforward component composition.
