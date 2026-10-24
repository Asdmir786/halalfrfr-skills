# Quality and Definition of Done

## Quality Priorities

Rank the product's most important qualities.

1. TBD
2. TBD
3. TBD

## Repository Verification Commands

Replace placeholders with actual commands from package/composer scripts and CI.

```text
install: TBD
lint/format: TBD
typecheck/static analysis: TBD
unit tests: TBD
integration tests: TBD
contract tests: TBD
e2e tests: TBD
build: TBD
migration validation: TBD
security/dependency checks: TBD
```

## Test Strategy

| Risk/behavior | Unit | Integration | Contract | E2E | Visual/manual |
|---|---:|---:|---:|---:|---:|
| Critical workflow | as needed | yes | yes | yes | yes |
| Authorization/tenancy | policy logic | yes | API | critical path | UI state |
| Financial totals/idempotency | yes | yes | yes | critical path | — |
| Design-system component | — | component | — | key flow | visual/a11y |
| Provider/webhook | mapper | fixture/database | payload | selective | logs |

Adjust to the actual product.

## Required Negative Cases

- unauthenticated;
- wrong role;
- wrong tenant/branch/resource owner;
- missing entitlement;
- invalid workflow transition;
- duplicate/replayed request;
- provider timeout/failure;
- validation failure;
- expired session/link;
- database constraint/concurrency conflict.

## UI State Matrix

For changed surfaces verify relevant states:

- default;
- loading;
- empty;
- error and retry;
- partial/stale;
- pending/disabled;
- permission denied;
- entitlement unavailable;
- success;
- long content/localization;
- large data volume;
- reduced motion;
- keyboard/focus.

## Viewport and Device Matrix

Default representative viewports:

```text
390 × 844      mobile
768 × 1024     tablet
1280 × 720     ordinary laptop height
1366 × 768     common laptop
1440 × 900+    desktop
```

Adjust based on actual audience. Do not require every viewport for a tiny local change.

## Accessibility

- semantic structure;
- accessible names/labels;
- keyboard operation;
- visible focus;
- contrast;
- error association;
- dialog/menu focus management;
- touch targets;
- reduced motion;
- status not conveyed by color alone.

Target standard: TBD (normally WCAG 2.2 AA where applicable).

## Performance Budgets

Set budgets based on product and baseline.

| Area | Target/budget | Measurement |
|---|---|---|
| Initial route/loading | TBD | real/build/lab |
| Interaction latency | TBD | TBD |
| Layout stability | TBD | TBD |
| JS bundle/heavy feature | TBD | TBD |
| Image/media | TBD | TBD |
| API latency/error | TBD | TBD |

Do not optimize hypothetical bottlenecks; do not ignore regressions in critical routes.

## Security Quality Gate

Refer to `docs/SECURITY.md`. Required before release:

- server authorization and tenant scope;
- validation;
- idempotency/concurrency where needed;
- secret/config review;
- dependency/secret scan;
- high-risk findings resolved or accepted.

## Database and Migration Gate

- migration SQL/behavior reviewed;
- constraints and indexes verified;
- data backfill tested;
- deployment order known;
- destructive operations approved;
- rollback/forward-fix known;
- backup/restore expectation confirmed for risky changes.

## Release Gate

- CI passes;
- production build succeeds;
- environment variables validated;
- frontend/backend compatibility checked;
- workers/scheduler healthy;
- smoke tests completed;
- logs/error monitoring/health checks available;
- rollback or kill switch available where risk requires it.

## Definition of Done

A feature is done when:

- acceptance behavior works;
- permissions/tenancy are enforced and tested;
- validation and database integrity exist;
- required UI states and responsive behavior are present;
- relevant accessibility/performance/security checks pass;
- migrations and operations are safe;
- docs changed only where decisions changed;
- the agent reports exact evidence and remaining uncertainty.

## Known Quality Gaps

- TBD
