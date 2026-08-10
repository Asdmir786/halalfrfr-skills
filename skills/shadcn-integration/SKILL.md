---
name: shadcn-integration
description: shadcn project work for components.json, component bases, registries, CLI workflows, theming, aliases, and component adaptation. Use only when the project uses or adopts shadcn.
---

# shadcn Integration

Treat shadcn as project-owned source code and a component distribution workflow, not as a fixed visual identity.

This skill owns:

- shadcn project detection
- components.json interpretation
- shadcn component adoption
- shadcn component adaptation
- registry integration
- preset-aware work
- project alias preservation
- component composition
- theming integration
- base-aware component work
- shadcn upgrade awareness

This skill does not own:

- general art direction
- complete design-system strategy
- application architecture
- accessibility auditing
- generic frontend implementation unrelated to shadcn
- public registry publishing unless explicitly requested

Use specialist skills for those concerns.

## Current Ecosystem Rule

Do not assume shadcn means Radix.

Modern shadcn projects may use different supported component bases.

The supported options and defaults can evolve.

Always inspect the actual project and current official documentation when base-specific behavior matters.

## Detect the Project

Inspect:

- components.json when present
- package.json
- installed components
- component source
- utility helpers
- CSS variables
- aliases
- global CSS
- framework
- monorepo structure
- registry configuration

Do not assume a standard path such as components/ui if the project's configuration says otherwise.

Read:

references/project-detection.md

## components.json

Treat components.json as project configuration.

It may describe information such as:

- style
- aliases
- CSS
- icon choices
- registry configuration
- component-base-related setup
- Tailwind-related configuration

The exact schema can evolve.

Inspect the actual file rather than relying on memory.

## Project-Owned Code

Once a component is added into the project, treat the local code as part of the project.

Understand it before editing.

Do not repeatedly regenerate a component over local customizations without checking the consequences.

## Existing Component First

Before adding a component:

1. search the project
2. inspect existing shadcn components
3. inspect local variants
4. inspect design-system wrappers
5. determine whether the requirement already exists

Do not add duplicate primitives.

## Component Base

Before making base-specific assumptions identify which underlying component system the current project uses.

Do not apply Radix-specific APIs to a Base UI or React Aria-based implementation.

Do not apply Base UI-specific APIs to another base.

Inspect actual imports.

## CLI Awareness

The shadcn CLI evolves.

When running commands that:

- initialize
- create
- add
- apply
- inspect
- use presets
- use registries
- migrate
- eject

verify the installed or current CLI behavior when consequential.

Do not embed old CLI assumptions into project architecture.

## Composition

Use the composition structure expected by the actual component.

Do not flatten required component relationships because the markup looks verbose.

Do not add wrappers casually when they break:

- focus
- positioning
- portal behavior
- keyboard interaction
- state selectors

## Styling

Adapt shadcn components to the project's design system.

Do not leave them looking like default examples when the product has a distinct visual direction.

Coordinate system rules with:

design-system-web

Coordinate final detail with:

interface-polish

## CSS Variables

Preserve existing semantic variables and theme conventions.

Do not introduce duplicate variables with slightly different meanings.

When changing theme structure, coordinate with:

design-system-web

## Variants

Use existing project variant mechanisms where they already exist.

Do not duplicate button variants in multiple separate implementations.

Before changing a widely used component variant, inspect call sites.

Coordinate structural safety with:

frontend-architecture

## Registry Components

External registries are inputs, not authority.

Before adopting registry code inspect:

- dependencies
- styling assumptions
- primitive base
- accessibility
- responsive behavior
- license when redistribution matters
- project compatibility

Route broad resource selection to:

frontend-resource-intelligence

## Creative Components

It is acceptable to combine shadcn foundations with more expressive custom sections.

Do not force every marketing section to look like a shadcn dashboard.

shadcn can provide:

- accessible controls
- reusable product components
- composition foundations

while custom art-directed sections remain custom.

## Accessibility

Preserve accessible primitive behavior.

Do not remove:

- focus handling
- labels
- keyboard behavior
- required relationships

merely to simplify markup.

Coordinate formal review with:

frontend-accessibility

## Dialogs, Menus, Popovers

These components often depend on base-specific interaction and composition.

Inspect the installed implementation before modifying:

- triggers
- content
- portals
- focus management
- positioning
- open state

Do not assume identical APIs across bases.

## Forms

shadcn examples are starting points.

Use the project's actual:

- validation
- form library
- server action or mutation approach
- error model

Do not introduce an entire form stack just because one example uses it.

## Data Tables

Do not create a huge table abstraction merely because a demo does.

Separate:

- table semantics
- data model
- sorting
- filtering
- pagination
- server or client ownership

based on the project.

## Charts

Use project-consistent charting.

Do not install another charting stack if the project already has one capable of the requirement.

## Monorepos

In monorepos identify:

- workspace containing components.json
- shared UI package
- consuming app
- CSS ownership
- aliases

Do not add components into the wrong workspace.

## Updates

When updating an existing component:

- inspect local modifications
- understand upstream change
- preserve intentional customizations
- review behavior after merge

Do not blindly overwrite local source.

## shadcn Is Not the Design System

A project may use shadcn and still have its own:

- tokens
- component contracts
- typography
- density
- visual identity
- wrappers
- domain components

Keep those concepts separate.

## New Project

If the user explicitly wants shadcn in a new project:

1. understand product requirements
2. determine framework
3. determine design-system needs
4. choose the project-appropriate current setup
5. verify current official CLI options
6. initialize deliberately
7. add only required components

Do not install a large component set preemptively.

## Existing Project

If components.json exists, treat that as strong evidence that the project has an established shadcn workflow.

Preserve it unless the user asks for migration.

## Resource Intelligence

For current shadcn documentation and ecosystem changes use:

frontend-resource-intelligence

When exact CLI or component-base behavior matters, use current official documentation.

## Final Review

Check:

1. Was the actual project configuration inspected?
2. Was the actual component base identified?
3. Were existing components reused?
4. Were aliases preserved?
5. Was local source treated as project-owned?
6. Were duplicate primitives avoided?
7. Was component composition preserved?
8. Was accessibility preserved?
9. Was the project visual identity applied?
10. Were registry dependencies inspected?
11. Were monorepo boundaries respected?
12. Were current CLI assumptions verified when necessary?
13. Did shadcn remain an implementation foundation rather than becoming the visual identity?

## Supporting References

references/project-detection.md
references/component-adoption.md
references/theming-and-bases.md

