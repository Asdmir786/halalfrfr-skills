---
name: ai-slop-guard
description: Detect and remove generic AI-generated visual, UX, component, dashboard, and copy patterns while preserving functionality and the approved product direction. Use for bland template-like UI, excessive cards/gradients/pills, fake metrics, generic text, weak hierarchy, or before final frontend approval. Integrates with Impeccable when installed.
metadata:
  family: halalfrfr
  version: "4.0.0"
---


# AI Slop Guard

Remove generic model defaults without replacing them with arbitrary personal taste.

## Establish the Lane First

Determine whether the surface is:

- operational product UI;
- data-heavy dashboard;
- consumer workflow;
- admin/configuration;
- marketing or brand experience;
- hybrid.

The same visual choice can be correct in one lane and harmful in another.

Read the project's `DESIGN.md`, existing tokens, components, supplied references, and rendered interface before judging.

## Visual Slop Signals

Investigate, do not blindly ban:

- default purple-to-blue gradients;
- glowing dark-mode accents without product meaning;
- enormous headings in operational screens;
- every section centered;
- cards nested inside cards;
- excessive rounded rectangles and pills;
- icon tile above every heading;
- border, shadow, blur, and glow stacked on the same surface;
- equal-weight grids with no dominant task;
- random illustration or abstract blobs;
- overuse of muted low-contrast text;
- one font weight and one spacing rhythm everywhere;
- animation on every element;
- shadcn defaults left unadapted;
- visual novelty that slows routine work.

A gradient, Inter, a card, or a pill is not automatically wrong. It is wrong when it is unexplained, repetitive, or inconsistent with the product.

## Dashboard Slop Signals

- KPI cards generated from every available metric;
- charts that answer no decision question;
- fake or placeholder business data presented as real;
- primary work hidden below summary decoration;
- identical layouts for every role;
- important actions buried in kebab menus;
- tables replaced by cards without a mobile/product reason;
- empty states containing generic celebration copy instead of a next action.

## UX Slop Signals

- unclear source of truth;
- repeated confirmation for safe actions but no protection for dangerous ones;
- hidden system status;
- optimistic UI without failure recovery;
- missing loading, empty, error, no-permission, and long-content states;
- generic workflows copied from unrelated products;
- animation masking slow behavior.

## Copy Slop Signals

- `Unlock`, `revolutionize`, `supercharge`, `seamless`, `effortless`, `next-level`, or `all-in-one` without specific evidence;
- headings that repeat the card title in longer words;
- empty states that say only `Nothing here yet`;
- errors that say only `Something went wrong`;
- buttons such as `Continue` when the actual action can be named;
- fake confidence, fake testimonials, fake metrics, or generic assistant tone inside product UI.

Route copy work to `product-copy-quality`.

## Audit Workflow

1. inspect the live rendered UI at representative routes and states;
2. identify the user's primary task and approved visual thesis;
3. list issues by severity and evidence;
4. distinguish system-wide patterns from local defects;
5. fix the smallest set that restores hierarchy, coherence, usability, and identity;
6. preserve business behavior and accessibility;
7. compare before/after screenshots at defined viewports;
8. run design, accessibility, and performance checks.

Do not redesign unrelated screens automatically.

## Impeccable Companion

When Impeccable is installed, use it as an additional deterministic detector and critic:

```text
/impeccable audit
/impeccable critique
/impeccable polish
/impeccable harden
```

or run its detector against the relevant source/rendered target.

Impeccable does not replace:

- project product context;
- HalalFrFr creative direction;
- design-system ownership;
- frontend architecture;
- SaaS dashboard information architecture;
- responsive composition;
- accessibility or visual QA.

Resolve conflicts using the project's approved design direction and actual user task.

## Output

For an audit, report:

- critical usability or accessibility problems;
- high-impact hierarchy and workflow problems;
- repeated system-level slop patterns;
- local polish issues;
- copy problems;
- proposed fixes not yet implemented.

For implementation, show visual evidence and list any suggestions intentionally left out of scope.
