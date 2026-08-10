---
name: redesign-existing-projects
description: Redesign or modernize an existing frontend while preserving working behavior, architecture, integrations, and product intent. Use for substantial visual upgrades to existing projects.
---

# Redesign Existing Projects

Improve what exists without treating the current product as disposable.

This skill owns:

- redesign audit
- visual weakness identification
- redesign scope
- preservation strategy
- modernization
- visual-system cleanup
- targeted composition improvement
- generic-pattern reduction
- staged redesign
- regression-aware redesign

This skill does not own:

- new-project art direction
- complete application rearchitecture by default
- backend changes
- motion implementation details
- 3D implementation
- final accessibility certification
- final performance optimization

Use specialist skills for those concerns.

## Core Principle

Audit first.

Preserve what works.

Change what is weak.

Do not assume redesign means rebuild.

## Establish the Preservation Contract

Before editing identify what must remain stable.

Possible protected areas include:

- functionality
- routing
- data flow
- APIs
- forms
- integrations
- state behavior
- analytics hooks
- permissions
- business logic
- accessibility behavior

Read:

references/preservation-contract.md

## Capture the Baseline

When browser access is available, capture the current interface before major changes.

Record:

- important routes
- important states
- desktop
- mobile
- key interactions

This creates a regression reference.

Coordinate screenshots with:

visual-qa

## Audit the Existing Interface

Inspect:

- hierarchy
- typography
- spacing
- density
- layout
- navigation
- surfaces
- controls
- icons
- media
- responsiveness
- consistency
- empty states
- loading states
- errors
- motion
- accessibility
- performance-sensitive visuals

Read:

references/redesign-audit.md

## Classify Findings

Classify each issue as:

- structural
- systemic
- compositional
- component-level
- polish
- responsive
- accessibility
- performance

Do not solve every category with visual styling.

## Preserve Strong Patterns

Identify what already works.

Examples:

- navigation model
- information architecture
- component behavior
- useful density
- brand color
- strong typography
- good data layout

Do not remove strengths merely to make the redesign visibly different.

## Scope the Redesign

Choose the smallest scope that achieves the requested result.

Possible scopes:

- polish only
- component normalization
- section redesign
- page redesign
- design-system refresh
- navigation refresh
- multi-page visual refresh

Do not perform a full design-system migration for one weak card unless the system itself is the problem.

## Visual Direction

If the existing visual language lacks a coherent direction, coordinate with:

creative-direction

If the direction is already appropriate, preserve it and improve execution.

Do not accidentally rebrand the company.

## Design System

When repeated inconsistencies exist coordinate with:

design-system-web

Examples:

- random radii
- inconsistent spacing
- multiple button styles
- inconsistent surfaces
- uncontrolled typography

Do not tokenise every one-off marketing composition.

## Architecture

Coordinate structural changes with:

frontend-architecture

Avoid moving files or changing component APIs unless the redesign actually requires it.

## Implementation

Coordinate code changes with:

frontend-ui-engineering

Preserve business behavior unless functional changes are requested.

## Responsive Redesign

Do not redesign desktop and leave old mobile behavior unchanged.

Coordinate with:

responsive-composition

A redesigned visual system must survive real laptop, tablet, and mobile layouts.

## Asset Redesign

If weak media limits the visual result, coordinate with:

asset-direction

Do not compensate for poor imagery with excessive CSS decoration.

## Motion

Introduce advanced motion only when it strengthens the redesign concept.

Coordinate with:

advanced-motion

Do not make a previously simple product feel slower merely to appear premium.

## 3D

Use real-time 3D only when the product genuinely benefits.

Coordinate with:

web-3d

A redesign does not require 3D to feel modern.

## Accessibility Preservation

A visual redesign can easily introduce regressions.

Coordinate with:

frontend-accessibility

Watch especially for:

- removed focus states
- weak contrast
- custom controls
- hidden labels
- reordered content
- inaccessible overlays

## Performance Preservation

A redesign can increase:

- image weight
- JavaScript
- animation
- blur
- video
- WebGL

Coordinate with:

frontend-performance

Do not trade basic usability for visual spectacle without explicit product justification.

## Change Strategy

Prefer staged coherent changes.

Example sequence:

1. baseline
2. visual direction
3. shared system
4. major composition
5. components
6. responsive
7. polish
8. QA

Read:

references/change-strategy.md

## Avoid Generic AI Redesign

Watch for automatic additions such as:

- gradient hero
- floating fake dashboard
- bento everywhere
- glowing borders
- excessive pills
- three identical feature cards
- meaningless metrics
- decorative blobs
- glass everywhere

These patterns are not forbidden.

They require product-specific justification.

Coordinate deeper art direction with:

creative-direction

## Do Not Destroy Density

Operational software may need density.

Do not turn:

useful compact dashboard

into:

large empty marketing cards

unless the product requires the change.

## Do Not Add Fake Content

Do not invent:

- metrics
- testimonials
- logos
- customers
- product data
- fake integrations

merely to make the redesign look complete.

Use real supplied data or clearly labelled placeholders when a mockup requires them.

## Regression Loop

After meaningful changes verify:

- navigation
- forms
- key actions
- routing
- data display
- responsive behavior
- visual comparison
- console errors

Coordinate final rendered review with:

visual-qa

## Final Review

Check:

1. Did the redesign solve the user's actual complaint?
2. Was working functionality preserved?
3. Were strong existing patterns retained?
4. Was unnecessary rearchitecture avoided?
5. Is the visual direction more coherent?
6. Is the design less generic?
7. Is responsive quality improved?
8. Were realistic product states preserved?
9. Were fake content and unnecessary effects avoided?
10. Are accessibility regressions controlled?
11. Are performance costs justified?
12. Does the result still feel like the same product unless a rebrand was requested?

## Supporting References

references/redesign-audit.md
references/change-strategy.md
references/preservation-contract.md

