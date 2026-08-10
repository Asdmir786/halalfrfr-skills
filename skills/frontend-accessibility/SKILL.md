---
name: frontend-accessibility
description: Frontend accessibility implementation and WCAG-oriented review for semantics, keyboard use, focus, forms, dialogs, contrast, motion preferences, and remediation.
---

# Frontend Accessibility

Make frontend experiences usable across different abilities, input methods, and assistive technologies.

This skill owns:

- semantic HTML
- keyboard interaction
- focus behavior
- accessible names
- labels
- form accessibility
- error communication
- dynamic content behavior
- dialogs and overlays
- navigation accessibility
- contrast review
- motion preference handling
- target-size awareness
- accessible state
- WCAG-oriented auditing
- remediation guidance

This skill does not own:

- legal compliance certification
- general art direction
- frontend architecture
- performance optimization
- motion choreography
- visual QA unrelated to accessibility

Use specialist skills for those concerns.

## Standard Baseline

Use WCAG 2.2 as the primary standards baseline unless the project requires another specific standard or contractual target.

WCAG and related interpretations can evolve.

When exact success criteria, conformance claims, regulatory requirements, or legal obligations matter, verify the current official standard and applicable jurisdiction.

Do not claim formal compliance based only on an automated scan.

## Core Principle

Accessibility is part of product behavior.

It is not a final decorative checklist.

## Existing Project First

Inspect:

- component primitives
- semantic structure
- focus styles
- form patterns
- dialog implementation
- navigation
- keyboard behavior
- screen-reader utilities
- error patterns
- accessibility tests
- axe integration
- Storybook accessibility tooling
- existing audit reports

Preserve accessible behavior already provided by established primitives.

Do not replace accessible primitives with custom div-based controls merely for styling convenience.

## Native Before ARIA

Prefer native semantic elements when they already provide the correct meaning and behavior.

Examples:

- button
- input
- select
- textarea
- details
- headings
- lists
- table
- anchor

ARIA can supplement semantics.

ARIA should not be used to recreate native controls unnecessarily.

## Accessible Names

Interactive elements need an understandable accessible name.

Possible sources include:

- visible text
- associated label
- appropriate aria-label
- appropriate aria-labelledby

Do not add aria-label blindly when visible text already provides the correct accessible name.

## Buttons and Links

Use buttons for actions.

Use links for navigation.

Do not style a generic element to behave like a button unless a native element genuinely cannot satisfy the requirement.

## Keyboard

Ensure relevant interactions work without a pointer.

Test:

- Tab
- Shift+Tab
- Enter
- Space where appropriate
- Escape where appropriate
- arrow keys for widgets that require them

Do not invent custom keyboard models when established widget patterns exist.

Read:

references/semantic-and-keyboard.md

## Focus

Focus should be:

- visible
- predictable
- moved intentionally
- restored where appropriate

Do not remove focus indication solely because it looks visually strong.

Coordinate visual styling with:

interface-polish

## Dialogs and Overlays

Dialogs typically require careful handling of:

- initial focus
- contained interaction
- accessible name
- close mechanism
- Escape behavior when appropriate
- focus restoration
- background interaction

Prefer established accessible primitives when available.

Do not recreate complex dialog behavior from scratch merely to control styling.

Read:

references/focus-dialogs-dynamic-ui.md

## Forms

Forms need:

- programmatic labels
- instructions where needed
- clear errors
- appropriate grouping
- keyboard access
- submission feedback
- disabled behavior used carefully

Do not rely on placeholders as labels.

Read:

references/forms-and-errors.md

## Errors

Error messages should:

- identify the problem
- associate with the relevant field or region
- provide useful recovery guidance when possible

Do not communicate error state using color alone.

## Required Fields

Communicate required state understandably.

Do not rely only on a visual asterisk without appropriate context.

## Headings

Use heading structure to represent content hierarchy.

Do not choose heading levels solely for visual size.

Style semantics visually rather than changing semantics to get a preferred appearance.

## Landmarks

Use meaningful page structure where appropriate.

Examples:

- header
- nav
- main
- aside
- footer

Do not add landmark roles redundantly when native elements already provide them.

## Images

Meaningful images need useful alternatives.

Decorative images should not create unnecessary spoken noise.

Alternative text should communicate the purpose of the image in context.

Do not mechanically describe every visual detail.

## Icons

Icon-only actions need an accessible name.

Decorative icons inside already-labelled controls should normally not create redundant accessible content.

## Tables

Use actual table semantics for true tabular relationships.

Provide appropriate headers.

Do not convert a comparison table into generic divs solely for styling.

## Dynamic Content

When UI changes dynamically, consider whether assistive technology users understand the change.

Examples:

- validation
- notifications
- loading completion
- status
- result counts

Use live-region behavior only when needed.

Do not make every changing value announce continuously.

## Loading

Communicate loading state appropriately for important operations.

Avoid creating repeated noisy announcements.

## Color

Do not use color as the only way to communicate:

- status
- error
- selection
- required state
- difference

Use text, iconography, shape, or another cue when needed.

## Contrast

Check relevant:

- text
- controls
- states
- focus indicators
- icons conveying information

Do not treat contrast as purely aesthetic.

When exact WCAG ratios or criteria matter, verify the current official standard.

## Motion

Respect reduced-motion preferences where significant motion exists.

Coordinate complex motion with:

advanced-motion

Do not remove essential information in the reduced-motion version.

## Touch Targets

Interactive targets need sufficient usable area and separation for the intended context.

Do not make visually tiny controls difficult to activate.

When exact WCAG target-size requirements matter, verify current WCAG 2.2 criteria.

## Responsive Accessibility

Responsive transformations can change:

- reading order
- focus order
- navigation
- table behavior
- dialog behavior

Coordinate with:

responsive-composition

Do not create a visually reordered interface whose keyboard or reading order becomes confusing.

## Hidden Content

Understand the difference between:

- visually hidden
- display hidden
- accessibility-tree hidden
- off-screen
- collapsed but still interactive

Do not leave focusable elements hidden behind collapsed UI.

## Custom Widgets

Before creating a custom widget ask whether an established accessible primitive already exists.

For complex controls such as:

- combobox
- menu
- tabs
- dialog
- listbox
- tooltip

prefer proven primitives and patterns.

For resource selection coordinate with:

frontend-resource-intelligence

## shadcn

When using shadcn components, preserve the accessibility behavior of the selected component base.

Do not assume every shadcn project uses the same primitive base.

Coordinate shadcn-specific changes with:

shadcn-integration

## Testing Layers

Use multiple forms of validation.

### Automated

Useful for finding many mechanical issues.

Examples may include axe-based tooling.

### Keyboard

Navigate the actual interface.

### Visual focus review

Ensure focus is visible and understandable.

### Manual semantic review

Inspect structure and relationships.

### Assistive technology review

Use when project requirements warrant deeper validation.

Automated tools cannot prove complete accessibility.

Read:

references/wcag-workflow.md

## Accessibility During Redesign

Do not lose existing accessible behavior during visual redesign.

Common regressions include:

- replacing button with div
- hiding focus
- removing labels
- breaking heading order
- custom overlays without focus handling
- hover-only interaction
- low-contrast muted text

Coordinate major redesigns with:

redesign-existing-projects

## Accessibility During 3D

Essential information should not exist only inside a canvas.

Provide an accessible equivalent for essential product content or actions.

Coordinate with:

web-3d

## Final Review

Check:

1. Is semantic HTML used appropriately?
2. Can important functionality be used by keyboard?
3. Is focus visible?
4. Is focus moved and restored correctly where needed?
5. Do controls have useful accessible names?
6. Are forms labelled?
7. Are errors understandable?
8. Is color not the only signal?
9. Are headings meaningful?
10. Are dialogs accessible?
11. Are dynamic updates understandable?
12. Is reduced motion supported where needed?
13. Did responsive reordering preserve logical order?
14. Did automated and manual checks both occur?
15. Are formal compliance claims avoided unless actually justified?

## Supporting References

references/semantic-and-keyboard.md
references/forms-and-errors.md
references/focus-dialogs-dynamic-ui.md
references/wcag-workflow.md

