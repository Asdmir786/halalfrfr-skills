---
name: saas-dashboard-ux
description: Design and review operational SaaS applications, dashboards, admin panels, queues, tables, settings, and role-specific workspaces. Start from user decisions and workflows, not card grids; define information architecture, states, density, actions, tables, charts, permissions, and responsive transformations.
metadata:
  family: halalfrfr
  version: "4.0.0"
---


# SaaS Dashboard UX

## Native Planning

For greenfield, broad, risky, cross-layer, or materially ambiguous work, use the host application's native Plan Mode before editing. Let the native planner inspect evidence, ask only material clarifications, and produce a reviewable plan. Do not replace it with a separate scripted questionnaire. For a focused, reversible task with sufficient context, proceed directly after inspection.


Design software people can operate, not a collection of attractive cards.

## Start With the Role

For each workspace or dashboard define:

- role;
- responsibility;
- top questions the role must answer;
- urgent exceptions;
- most common actions;
- time horizon;
- required comparisons;
- permissions and scope.

A dashboard should help a person decide or act. It is not a database-field showcase.

## Screen Contract

Before substantial implementation, establish:

- screen name and route;
- user goal;
- primary action;
- main work surface;
- supporting information;
- filters and scope;
- data freshness;
- permissions;
- loading, empty, error, partial, stale, and no-access states;
- mobile/tablet/laptop transformation;
- acceptance evidence.

Keep this in `docs/UX.md` or a feature specification when the screen is complex.

## Dashboard Grammar

Prefer this hierarchy when appropriate:

1. product shell and workspace context;
2. page title, scope, status, and primary action;
3. search, filters, date, or saved view controls;
4. small summary layer only when it supports decisions;
5. dominant operational surface such as a table, queue, board, calendar, editor, or timeline;
6. supporting insight, exceptions, or activity.

Do not let summary cards consume more attention than the user's actual work.

## Tables and Lists

For operational data, tables or structured lists are often the primary interface.

Define:

- row identity;
- priority columns;
- sorting/filtering ownership;
- server versus client pagination;
- bulk actions;
- row actions;
- selection behavior;
- sticky areas only when useful;
- dense and comfortable modes if the product needs both;
- long content and narrow viewport behavior;
- empty, loading, error, and partial data states.

Do not hide critical row actions behind hover-only behavior.

## Charts

Use a chart only when it answers a real question:

- trend over time;
- comparison between categories;
- composition;
- distribution;
- relationship.

Use a number, table, status list, or text explanation when it communicates the answer more directly.

Each chart needs:

- a decision question;
- clear unit and time range;
- comparison baseline when relevant;
- accessible labels or data alternative;
- honest scales;
- useful empty and loading states.

Do not add decorative charts or invented metrics to make a dashboard look complete.

## Forms and Settings

Group fields by user meaning, not database table. Use progressive disclosure for advanced or dangerous settings. Explain consequences near the control. Require confirmation for destructive or hard-to-reverse actions.

Errors must identify what happened and what the user can do next.

## Permissions

The interface should explain unavailable actions appropriately, but server authorization remains mandatory. Distinguish:

- hidden because irrelevant;
- disabled with a reason;
- visible but permission denied;
- unavailable because of plan entitlement;
- unavailable because of current workflow state.

## Responsive Transformation

Do not merely stack the desktop dashboard.

At each constrained viewport decide:

- which action remains primary;
- which information is essential;
- whether a table becomes priority rows plus details;
- where filters move;
- how navigation changes;
- which comparisons can be deferred;
- whether a bottom action area or sheet improves operation.

Inspect at mobile, tablet, ordinary laptop height, and desktop. Laptop-height testing is required for dense products.

## State and Status Language

Use explicit workflow statuses with clear allowed transitions. Avoid several booleans that can contradict one another.

Status color supports the label; it must not be the only signal.

## Design-System Relationship

Route reusable visual decisions to `design-system-web`, implementation to `frontend-ui-engineering`, architecture to `frontend-architecture`, responsive behavior to `responsive-composition`, and rendered review to `visual-qa`.

Use `ai-slop-guard` and `product-copy-quality` for generic visual or textual output.
