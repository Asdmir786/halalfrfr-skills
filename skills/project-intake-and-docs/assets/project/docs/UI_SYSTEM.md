# UI System

> This document turns `DESIGN.md` into reusable implementation rules. Code remains the source of truth for exact token values, component variants, and installed library source.

## System Status

- Foundation: existing / extracted / new / migrating
- Primitive/component base: TBD
- Styling system: TBD
- Token source: TBD
- Component source paths: TBD
- Story/design-lab paths: TBD

## Foundation Policy

- Preserve a coherent existing system.
- Normalize a fragmented system incrementally rather than rewriting every screen at once.
- For new products, use maintained accessible primitives and build product-specific visual rules around them.
- Treat HTML/screenshots as evidence, not production component architecture.
- Use one main primitive foundation, icon family, chart system, form strategy, motion system, and notification approach unless a documented need requires another.

## Token Architecture

```text
primitive values → semantic roles → limited component tokens → components/patterns
```

### Semantic color roles

| Role | Purpose | Light | Dark | Restrictions |
|---|---|---|---|---|
| background | page canvas | TBD | TBD | — |
| surface | grouped content | TBD | TBD | not every section |
| surface-elevated | overlays/floating | TBD | TBD | overlays only |
| foreground | primary text | TBD | TBD | — |
| muted-foreground | secondary text | TBD | TBD | retain contrast |
| border | separation | TBD | TBD | avoid border overload |
| action-primary | primary action | TBD | TBD | not decorative |
| action-secondary | secondary action | TBD | TBD | TBD |
| danger | destructive/error | TBD | TBD | state only |
| warning | risk/attention | TBD | TBD | state only |
| success | confirmed outcome | TBD | TBD | state only |
| focus | keyboard focus | TBD | TBD | visible everywhere |

### Typography roles

| Role | Family/style | Weight | Scale | Line height | Usage |
|---|---|---:|---|---|---|
| Display | TBD | TBD | TBD | TBD | rare product/marketing hero |
| Page heading | TBD | TBD | TBD | TBD | route identity |
| Section heading | TBD | TBD | TBD | TBD | grouping |
| Body | TBD | TBD | TBD | TBD | normal content |
| Label | TBD | TBD | TBD | TBD | controls/metadata |
| Data/numeric | TBD | TBD | TBD | TBD | tables/KPIs/timers |

Define tabular figures and alignment where operational data benefits.

### Spacing and sizing

- Base spacing vocabulary: TBD
- Page gutters: TBD
- Primary content width: TBD
- Readable text width: TBD
- Control heights: TBD
- Component grouping: TBD
- Section separation: TBD
- Dense table rhythm: TBD
- Touch target minimum: TBD

### Shape, borders, and elevation

- Radius family: TBD
- Pill usage: TBD
- Border hierarchy: TBD
- Elevation method: tonal / border / shadow / overlap / mixed
- Overlay behavior: TBD

Do not combine border, shadow, blur, and glow without a deliberate purpose.

### Motion tokens

| Purpose | Duration range | Easing/behavior | Reduced-motion alternative |
|---|---|---|---|
| immediate feedback | TBD | TBD | immediate state |
| normal transition | TBD | TBD | fade/none |
| layout change | TBD | TBD | immediate/reduced |
| expressive sequence | TBD | TBD | static composition |

## Application Shell

- Workspace/tenant switcher: TBD
- Primary navigation: TBD
- Secondary navigation: TBD
- Page header anatomy: TBD
- Search/command behavior: TBD
- Context/date/filter placement: TBD
- Mobile navigation transformation: TBD
- Ordinary laptop-height behavior: TBD

## Primitive Components

For each component define purpose, anatomy, variants, sizes, states, accessibility, content limits, and responsive behavior.

- Button: TBD
- Input/textarea: TBD
- Select/combobox: TBD
- Checkbox/radio/switch: TBD
- Dialog/drawer/sheet: TBD
- Menu/popover/tooltip: TBD
- Tabs/segmented controls: TBD
- Toast/notification: TBD
- Badge/status: TBD
- Skeleton/progress: TBD

## Product Patterns

- Page header: TBD
- Filter/search bar: TBD
- Data table/list: TBD
- Form section: TBD
- Detail drawer: TBD
- Destructive confirmation: TBD
- Empty state: TBD
- Error/recovery state: TBD
- Permission/entitlement state: TBD
- Activity/timeline: TBD
- Dashboard summary: TBD
- Charts: TBD

## Domain Components

List product-specific components and keep them near their owning feature.

| Component | Owning feature | Purpose | Reuse boundary |
|---|---|---|---|
| TBD | TBD | TBD | TBD |

## Data Tables and Operational Surfaces

- Row height/density: TBD
- Sticky headers/columns: TBD
- Primary versus secondary columns: TBD
- Row and bulk actions: TBD
- Selection: TBD
- Sorting/filtering/pagination: TBD
- Loading/empty/error/partial states: TBD
- Mobile transformation: TBD
- Large-data strategy: TBD

## Forms and Validation

- Label/help/error placement: TBD
- Required/optional convention: TBD
- Save behavior: explicit / autosave / hybrid
- Pending and duplicate-submit prevention: TBD
- Destructive setting behavior: TBD
- Long-form disclosure: TBD
- Server error mapping: TBD

## Charts and Metrics

Use a chart only to answer a defined question in `docs/UX.md`.

- Default chart library: TBD
- Palette: TBD
- Tooltip/legend: TBD
- Comparison/baseline: TBD
- Accessible data alternative: TBD
- Empty/insufficient-data state: TBD
- Dashboard metric formatting: TBD

## Screen State Matrix

Important screens should define relevant states:

- default;
- initial loading;
- background refresh/stale;
- empty;
- validation failure;
- server/provider failure and retry;
- pending/disabled;
- permission denied;
- entitlement unavailable;
- success/confirmation;
- long content/localization;
- large data volume;
- offline/degraded mode where relevant.

## Responsive Transformations

| Pattern | Mobile | Tablet | Laptop | Desktop |
|---|---|---|---|---|
| Shell/navigation | TBD | TBD | TBD | TBD |
| Page header/actions | TBD | TBD | TBD | TBD |
| Table/list | TBD | TBD | TBD | TBD |
| Filters | TBD | TBD | TBD | TBD |
| Dialog/drawer | TBD | TBD | TBD | TBD |
| Charts/summary | TBD | TBD | TBD | TBD |

Representative QA viewports:

```text
390 × 844
768 × 1024
1280 × 720 or 1366 × 768
1440 × 900+
```

Adjust to the actual user/device audience.

## Accessibility Implementation

- semantic structure: TBD
- accessible names and descriptions: TBD
- visible focus: required
- keyboard behavior: TBD
- contrast target: TBD
- status not conveyed by color alone: required
- form error association: TBD
- dialog/menu focus management: TBD
- reduced motion: required
- screen-reader/live-region behavior: TBD

## Library and Component Intake

Before adding a component from shadcn or another source:

1. inspect the current project and existing capability;
2. preview or diff the incoming source;
3. adapt tokens, variants, copy, states, and accessibility;
4. avoid introducing a second competing foundation;
5. test representative states and viewports.

## AI-Slop Prohibitions

Unless explicitly justified by `DESIGN.md`, avoid:

- generic equal-card dashboards;
- fake or decorative metrics;
- charts without a user question;
- nested cards and excessive borders;
- repeated icon boxes and pill shapes;
- arbitrary gradients, glass, glow, or giant radii;
- oversized headings that displace the work surface;
- generic greetings, filler subtitles, and AI marketing phrases;
- motion that does not explain feedback, hierarchy, continuity, or status.

## Migration Rules for Existing Screens

- preserve behavior and contracts;
- establish baseline screenshots;
- normalize tokens/primitives first;
- migrate one route or feature at a time;
- remove old components only after usages are migrated;
- record intentional visual changes and verify critical states.

## Open UI-System Decisions

- TBD
