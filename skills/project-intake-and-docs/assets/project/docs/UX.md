# User Experience and Workflows

## Experience Principles

- TBD

## Personas and Responsibilities

| Persona/role | Main responsibility | Top questions | Most common actions |
|---|---|---|---|
| TBD | TBD | TBD | TBD |

## Permission and Scope Matrix

| Capability | Role A | Role B | Role C | Scope/conditions |
|---|---:|---:|---:|---|
| TBD | TBD | TBD | TBD | TBD |

This describes product intent. `docs/SECURITY.md`, backend policies, and automated tests enforce it.

## Navigation and Route Map

| Route/surface | Actor | Goal | Primary action | Main work surface |
|---|---|---|---|---|
| TBD | TBD | TBD | TBD | TBD |

## Critical Journeys

### Journey: TBD

- Trigger: TBD
- Actor: TBD
- Preconditions: TBD
- Happy path:
  1. TBD
- Data/state changes: TBD
- Notifications/side effects: TBD
- Failure and recovery: TBD
- Permission/tenant rules: TBD
- Completion state: TBD

## Workflow State Models

Define authoritative statuses and legal transitions instead of contradictory booleans.

```text
TBD → TBD → TBD
```

| State | Meaning | Allowed next states | Who may transition it? |
|---|---|---|---|
| TBD | TBD | TBD | TBD |

State invariants and API behavior belong in `docs/DATA_API.md`.

## Screen Inventory and State Requirements

| Surface | Default purpose | Required states | Responsive transformation |
|---|---|---|---|
| TBD | TBD | loading/empty/error/permission/etc. | TBD |

Consider:

- initial loading and background refresh;
- empty, partial, stale, and large-volume data;
- validation, network, and provider failures;
- pending/disabled/double-submit prevention;
- no permission and no entitlement;
- offline/degraded behavior where relevant;
- long names, localization, and narrow viewports.

## Dashboard and Operational Questions

For each role-specific dashboard:

| Role | Decision/question | Evidence needed | Primary action | Time sensitivity |
|---|---|---|---|---|
| TBD | TBD | TBD | TBD | TBD |

Do not add a metric or chart without a user question it answers.

## Notifications and Escalation

| Event | Recipient | Channel | Timing | Deduplication/escalation |
|---|---|---|---|---|
| TBD | TBD | TBD | TBD | TBD |

## Search, Filters, Sorting, and Bulk Work

- Search scope: TBD
- Default filters: TBD
- Shareable URL state: TBD
- Saved views: TBD
- Bulk actions and permissions: TBD
- Export behavior: TBD

## Responsive Priorities

- Mobile: TBD
- Tablet: TBD
- Ordinary laptop: TBD
- Desktop: TBD

Define what changes, collapses, moves, or disappears; do not merely stack the desktop layout.

## Accessibility and Content Requirements

- keyboard-critical flows: TBD
- screen-reader/status requirements: TBD
- terminology source: TBD
- date/time/currency conventions: TBD
- error and recovery language: TBD

## Assumptions and Open UX Decisions

- TBD
