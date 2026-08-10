---
name: frontend-ui-engineering
description: Production frontend implementation for React, Next.js, TypeScript, HTML, CSS, Tailwind, components, forms, interaction states, and responsive UI. Use when maintainable code must be built.
---

# Frontend UI Engineering

Implement frontend experiences cleanly, completely, and faithfully.

This skill owns:

- UI implementation
- component implementation
- React implementation
- framework-aware rendering
- TypeScript UI code
- forms
- interactive controls
- loading states
- empty states
- error states
- responsive implementation
- design-system consumption
- semantic markup
- component behavior
- integration of approved visual patterns

This skill does not own:

- broad art direction
- repository-wide architecture
- design-system strategy
- complex GSAP choreography
- WebGL scene design
- asset generation
- final accessibility audit
- final visual QA

Coordinate those with specialist skills.

## Core Principle

Production UI is not complete when it merely resembles the screenshot.

It must also:

- behave correctly
- respond correctly
- handle states
- preserve architecture
- remain understandable
- integrate with the project
- avoid unnecessary dependencies

## Inspect Before Implementing

For an existing project inspect:

- package.json
- framework
- TypeScript configuration
- styling system
- component primitives
- design-system components
- directory conventions
- existing patterns
- state approach
- data-fetching approach
- route structure
- tests
- linting and formatting
- components.json when present

Follow the project before introducing a new convention.

## Implementation Hierarchy

Prefer:

1. existing project component
2. existing project primitive
3. existing design-system pattern
4. compatible external component
5. custom implementation

Do not recreate working primitives unnecessarily.

For external resource selection route to:

frontend-resource-intelligence

## Architecture Contract

Follow boundaries established by:

frontend-architecture

Do not silently create a second architectural model.

If implementation reveals a genuine structural issue, resolve it deliberately rather than working around it with hidden coupling.

## Design Contract

When visual direction exists, preserve it.

Coordinate with:

creative-direction
design-system-web

Do not independently change the art direction because implementation would be easier.

If a visual decision is technically expensive, find the simplest implementation that preserves the intent.

## Components

Components should:

- have clear responsibility
- expose meaningful props
- consume design-system rules
- support necessary states
- remain composable
- avoid internal duplication

Do not split every element into a component.

Do not place an entire page into one monolithic component when responsibilities clearly differ.

## React Render Logic

Keep render logic pure.

Do not mutate external state during render.

Derive UI from props, state, context, and framework-provided data.

Prefer event handlers for user-triggered side effects.

Use effects when synchronization with an external system is actually required.

## State

Do not duplicate state unnecessarily.

Prefer:

- one source of truth
- derived values
- local state for local interactions
- shared state only when ownership is genuinely shared

Coordinate difficult ownership decisions with:

frontend-architecture

## Next.js

When working in a current Next.js App Router project:

- inspect the project's actual version
- preserve established conventions
- keep Server Components where client capabilities are unnecessary
- introduce Client Components where interactivity or browser-only behavior requires them
- keep client boundaries intentional

Do not add use client to large files merely to make one small interaction work.

Do not apply Next.js-specific architecture to unrelated frameworks.

## TypeScript

Prefer useful explicit types at boundaries.

Avoid weakening types with any merely to silence errors.

Use inference where it improves readability.

Type:

- component contracts
- important domain data
- external API boundaries
- reusable utilities
- event contracts where inference is insufficient

Do not create overly complex type machinery for simple UI.

## Styling

Respect the project's styling system.

For Tailwind projects:

- reuse project tokens and utilities
- avoid repeated arbitrary values when a token exists
- keep class composition understandable
- use established variant helpers when present

Arbitrary values are acceptable for genuine one-off art-directed composition.

Do not turn every unique position into a global token.

## Semantic Markup

Use semantic HTML where appropriate.

Examples include:

- button for actions
- anchor or framework link for navigation
- form controls for input
- heading hierarchy
- lists for actual lists
- tables for tabular information

Do not use generic div elements when native semantics already express the control correctly.

## Interaction States

Interactive components should consider applicable states:

- default
- hover
- focus
- active
- disabled
- loading
- error
- success
- selected
- expanded

Not every component needs every state.

Implement states that the interaction actually has.

## Loading

Loading UI should communicate progress without causing unnecessary layout instability.

Choose based on the product:

- skeleton
- spinner
- progress
- optimistic state
- inline status

Do not add skeletons everywhere automatically.

## Empty States

An empty state should explain:

- what is empty
- whether this is expected
- what the user can do next

Do not leave major product surfaces as unexplained blank panels.

## Error States

Errors should be:

- visible
- actionable when possible
- associated with the relevant control or area
- understandable

Do not expose raw technical errors directly to normal users unless the product intentionally does so.

## Forms

Implement:

- labels
- validation feedback
- disabled behavior where needed
- submission state
- error state
- keyboard behavior
- clear actions

Do not rely on placeholders as the only label.

Detailed accessibility belongs to:

frontend-accessibility

## Images and Media

Use approved assets from:

asset-direction

Preserve:

- aspect ratio
- focal point
- responsive crop
- intrinsic dimensions
- appropriate loading behavior

Coordinate heavy media optimization with:

frontend-performance

## Motion

Implement ordinary transitions with the simplest suitable mechanism.

Complex choreography belongs to:

advanced-motion

Do not introduce GSAP merely for a button hover.

Do not add animation to compensate for weak hierarchy.

## 3D

Real-time 3D implementation belongs to:

web-3d

The surrounding React/page integration should still follow normal engineering boundaries.

## Responsive Implementation

Do not implement only desktop.

Coordinate substantial responsive reinterpretation with:

responsive-composition

At minimum verify:

- narrow mobile
- typical mobile
- tablet or intermediate layout
- laptop
- wide desktop where relevant

Do not rely solely on framework breakpoint names.

Check actual layout behavior.

## Accessibility During Implementation

Accessibility is part of implementation, not only final audit.

Use:

- correct semantics
- keyboard-operable controls
- visible focus
- labels
- appropriate relationships
- accessible primitive behavior

Route formal review and remediation to:

frontend-accessibility

## Reuse

Reuse should reduce inconsistency.

Do not abstract two elements merely because their markup resembles each other.

Create reusable components when they share a meaningful contract.

## Dependencies

Before installing a package ask:

- does the project already solve this?
- is the package maintained?
- is its complexity justified?
- does it introduce another competing foundation?
- can the requirement be solved clearly without it?

Avoid dependency accumulation.

## Complete Implementation

Do not leave:

- TODO implementation placeholders
- fake handlers
- dead buttons
- unfinished states
- placeholder comments instead of requested functionality

unless the user explicitly requested a scaffold or mockup.

## Preserve Existing Functionality

For redesign or UI improvement tasks:

- preserve behavior
- preserve integrations
- preserve routing
- preserve data flow
- preserve working APIs

unless the user requested a functional change.

Coordinate major redesigns with:

redesign-existing-projects

## Verification

Before considering the implementation finished:

1. run available type checks
2. run relevant linting
3. run relevant tests
4. inspect runtime errors
5. verify major interactions
6. verify responsive layout
7. verify visual output

Use the project's existing commands rather than inventing command names.

For final browser visual review route to:

visual-qa

## Modification Discipline

When the user asks:

make this better

do not assume that means:

rewrite everything.

First inspect the existing implementation and improve the smallest coherent area that produces the requested outcome.

## Final Engineering Review

Check:

1. Does the implementation match the requested outcome?
2. Does it follow existing architecture?
3. Are component boundaries reasonable?
4. Is state modeled cleanly?
5. Are effects justified?
6. Are server and client boundaries correct where relevant?
7. Are design-system rules reused?
8. Are important states implemented?
9. Is responsive behavior complete?
10. Is the markup semantically appropriate?
11. Were unnecessary dependencies avoided?
12. Can another engineer safely modify this later?

## Supporting References

references/implementation-checklist.md
references/component-quality.md
references/edge-states.md

