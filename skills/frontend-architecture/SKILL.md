---
name: frontend-architecture
description: Frontend architecture for component boundaries, state ownership, data flow, server/client boundaries, feature isolation, reusable APIs, and safe refactors. Use for substantial structural frontend work.
---

# Frontend Architecture

Design frontend code so future changes remain local, predictable, and safe.

This skill owns:

- component boundaries
- feature boundaries
- state ownership
- data flow
- server and client boundaries
- dependency direction
- reusable component architecture
- composition strategy
- shared versus local code decisions
- API stability
- change locality
- refactor boundaries

This skill does not own:

- visual art direction
- design tokens
- asset creation
- detailed motion choreography
- WebGL scene design
- accessibility auditing
- browser visual QA

Use the relevant specialist skills for those concerns.

## Core Principle

Optimize architecture for understandable change.

A strong frontend architecture should make it easy to answer:

- where should this change happen?
- what else can this change affect?
- who owns this state?
- which component owns this behavior?
- what is reusable?
- what is intentionally local?

Do not optimize for the largest possible number of abstractions.

Do not optimize for the smallest possible files.

Optimize for clear responsibility.

## Existing Project First

Before restructuring an existing frontend, inspect:

- framework
- router
- rendering model
- directory structure
- feature organization
- shared components
- design-system components
- providers
- state libraries
- data-fetching patterns
- server and client boundaries
- tests
- established naming
- public component APIs

Preserve coherent architecture.

Do not reorganize the entire repository because another folder structure appears cleaner in isolation.

## Change Locality

A feature change should ideally affect the smallest sensible area of the codebase.

Prefer boundaries that keep:

- feature-specific behavior near the feature
- reusable primitives in shared locations
- reusable domain components near their domain
- global infrastructure explicitly global

Avoid globalizing code prematurely.

## Component Boundaries

Split components by responsibility.

Good reasons to extract a component include:

- meaningful reusable behavior
- independent state ownership
- independently understandable responsibility
- meaningful visual or interaction unit
- repeated use
- useful test boundary
- server and client boundary
- substantial internal complexity

Bad reasons include:

- arbitrary line count
- every div needs a component
- creating abstractions before a pattern exists

Do not create dozens of tiny components that require opening many files to understand one interface.

Do not create giant components containing unrelated responsibilities.

Read:

references/architecture-principles.md

## Reuse Must Be Earned

Prefer local implementation until a stable reusable pattern exists.

When repetition appears, ask whether the repeated code shares:

- purpose
- behavior
- semantics
- styling rules
- lifecycle

Two things that merely look similar do not necessarily belong in one abstraction.

Avoid premature universal components.

## Component APIs

Prefer component APIs that expose meaningful concepts.

Good:

- variant
- size
- status
- orientation

Be cautious with:

- many visual boolean props
- deeply coupled callbacks
- props that expose internal implementation details
- components that require many unrelated configuration objects

Use composition when content structure varies substantially.

Coordinate reusable visual variants with:

design-system-web

## State Ownership

Keep state as close as practical to the place that owns the interaction.

Move state upward only when multiple parts genuinely need coordinated access.

Avoid duplicating the same source of truth.

Avoid storing values in state when they can be derived safely from existing props or state.

Avoid contradictory state.

Examples of suspicious combinations:

- isOpen plus status that already determines openness
- selectedItem plus separately duplicated selectedItemId
- filteredItems stored separately when they can be derived cheaply

Read:

references/state-and-boundaries.md

## State Categories

Distinguish between:

### Local interaction state

Examples:

- open
- active tab
- selected row
- hover-related UI state
- local draft

Keep local when possible.

### Shared client state

Use when multiple distant interactive surfaces require synchronized client-owned state.

Do not introduce global state merely to avoid passing a few props.

### URL state

Use when state should be:

- shareable
- bookmarkable
- navigable
- restorable through browser history

Examples may include:

- filters
- pagination
- selected view
- search query

Use according to the framework and product requirements.

### Server-derived state

Do not automatically duplicate server data into another global client store.

Choose the project's established data-fetching and caching model.

## Effects

Do not use effects as a general-purpose data-flow mechanism.

Prefer:

- rendering from props and state
- event handlers for user-triggered changes
- derived values
- framework data mechanisms

Use effects when synchronizing React with an external system or lifecycle requirement.

Examples may include:

- browser APIs
- subscriptions
- non-React widgets
- certain imperative libraries

Keep effect dependencies correct.

Do not hide architecture problems inside effects.

## Render Purity

Rendering should calculate UI from inputs.

Do not mutate external values during render.

Do not make rendering depend on call order.

Keep side effects outside render.

## Next.js Server and Client Boundaries

When working in the Next.js App Router, inspect the current project and version before making framework-specific changes.

Prefer Server Components when the UI does not require client-only capabilities.

Use Client Components when the subtree needs capabilities such as:

- local interactive state
- event handlers
- effects
- browser APIs

Keep client boundaries intentional.

Do not add client rendering to a large subtree merely because one small child needs interaction.

Move the interactive boundary downward when practical.

Do not force this rule onto frameworks that do not use React Server Components.

## Boundary Composition

A server-rendered parent may compose interactive client children.

Prefer narrow interactive islands where that fits the architecture.

Do not fragment the interface merely to minimize client code if doing so makes the architecture difficult to understand.

Balance:

- clarity
- rendering behavior
- bundle cost
- interaction requirements

## Providers

Place providers only as high as necessary.

Avoid wrapping the entire application with feature-specific providers.

Keep domain-specific providers near their domain when practical.

## Context

Use context for values that are meaningfully shared through a subtree.

Do not use context as a replacement for all props.

Avoid very large contexts containing unrelated frequently changing data.

Split context by responsibility when that materially improves update behavior and clarity.

## Feature Boundaries

For substantial applications, prefer domain or feature boundaries that group related:

- components
- hooks
- types
- utilities
- tests

Do not force one universal folder strategy onto every project.

Examples of valid approaches include:

- route-oriented
- feature-oriented
- domain-oriented
- hybrid

Choose based on the existing codebase and application scale.

## Shared Code

A shared directory should contain code that is genuinely shared.

Do not move a feature component into shared simply because it might someday be reused.

Possible shared layers include:

- UI primitives
- design-system components
- generic hooks
- generic utilities

Domain-specific behavior should usually remain with its domain.

## Dependency Direction

Prefer predictable dependencies.

A useful conceptual direction is:

application or route
→ feature or domain
→ reusable UI
→ primitive or utility

Avoid low-level primitives importing feature-specific code.

Avoid circular feature dependencies.

## Styling Architecture

Preserve the project's established styling mechanism unless there is a concrete reason to change it.

Examples may include:

- Tailwind
- CSS Modules
- vanilla CSS
- CSS-in-JS
- another established system

Do not mix multiple styling systems casually.

Repeated visual values should coordinate with:

design-system-web

## Third-Party Components

Before adopting external code:

1. inspect existing project components
2. inspect the project's primitive library
3. evaluate the external dependency
4. adapt it to existing architecture
5. avoid introducing competing foundations

Route resource selection to:

frontend-resource-intelligence

## High-End Marketing Sections

Expressive sections may contain custom local architecture.

Examples:

- cinematic hero
- scroll-driven story
- product stage
- WebGL scene
- interactive visualization

Do not force these sections into generic card abstractions.

Still isolate their responsibilities.

A specialized visual section should not contaminate unrelated application architecture.

## AI Change Safety

When modifying an existing project:

1. inspect before editing
2. identify the smallest ownership boundary
3. inspect call sites before changing shared APIs
4. preserve public behavior unless change is requested
5. prefer small coherent diffs
6. avoid unrelated cleanup
7. avoid rewriting files merely to change style
8. preserve existing naming where reasonable
9. update dependent code when an API changes
10. verify after modification

Read:

references/change-safety.md

## Refactoring

Refactor when it improves:

- ownership
- readability
- reuse
- testing
- state flow
- rendering boundaries
- future change safety

Do not combine a major refactor with an unrelated visual task unless required.

Separate structural changes from cosmetic changes when practical.

## AI-Friendly Architecture

The codebase should be understandable to both humans and future coding agents.

Prefer:

- explicit names
- clear ownership
- predictable structure
- small public APIs
- colocated feature logic
- documented unusual behavior
- centralized repeated design rules

Avoid:

- hidden conventions
- magic global state
- unexplained duplication
- deeply indirect abstractions
- unnecessary metaprogramming
- cleverness without payoff

## Handoff to Implementation

After architecture is clear, route implementation to:

frontend-ui-engineering

For substantial visual systems also coordinate with:

design-system-web
responsive-composition

## Final Architecture Review

Check:

1. Does every major component have a clear responsibility?
2. Is state owned at the correct level?
3. Is duplicated state avoided?
4. Are effects used only when justified?
5. Are server and client boundaries intentional where relevant?
6. Is shared code genuinely shared?
7. Can a feature change remain local?
8. Are component APIs understandable?
9. Are external libraries contained?
10. Can visual experimentation remain isolated?
11. Can another engineer find where to make a change?
12. Can an AI agent modify one area without rewriting unrelated code?

## Supporting References

references/architecture-principles.md
references/state-and-boundaries.md
references/change-safety.md

