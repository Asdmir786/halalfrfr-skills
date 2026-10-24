# Native Plan Mode

Use the host application's native planning capability instead of maintaining a separate scripted interview process.

## When to use it

Use Plan Mode for:

- a new application or SaaS product;
- an undocumented or unfamiliar repository;
- a broad dashboard redesign;
- architecture or deployment changes;
- authentication, authorization, tenancy, billing, or sensitive data;
- database migrations or data backfills;
- a multi-module refactor;
- a task with material ambiguity or several plausible product directions.

Normal Agent mode is sufficient for a small, reversible, well-understood change.

## Cursor

Use Cursor's Plan Mode from the mode picker or the host's Plan Mode shortcut. In Cursor CLI, use its plan command/mode when available. Let it research the repository, ask material clarifications, and produce a reviewable plan before implementation.

## Codex

Use Codex Plan Mode from the mode picker or `/plan` where available. Let it inspect, clarify, and plan before implementation.

## Skill behavior inside Plan Mode

Skills provide domain judgment and constraints. The native planner owns the interaction sequence.

- Inspect before asking.
- Do not ask questions already answered by files, code, screenshots, documents, or prior decisions.
- Recommend a default when the user should not need to choose technical trivia.
- Ask only decisions that change product behavior, scope, security, cost, data, architecture, or visual direction.
- Make the plan concrete enough to name affected boundaries, data/API implications, verification, and risk.
- Once the plan is approved or the user directs execution, switch to implementation and do not restart discovery without new evidence.

## When mode switching is unavailable

A skill cannot always change the host UI mode itself. If the host exposes no mode-switch control:

- for a substantial task, tell the user to switch once or perform a concise planning pass in the current mode if they already asked you to continue;
- do not simulate a long formal interview;
- never block a safe task merely because a named mode is unavailable.
