---
name: product-copy-quality
description: Write and review concise, specific product UI copy and SaaS marketing copy without generic AI phrases. Use for labels, buttons, navigation, errors, empty states, permissions, onboarding, notifications, tooltips, dashboard headings, pricing, and product pages.
metadata:
  family: halalfrfr
  version: "4.0.0"
---


# Product Copy Quality

Write copy that helps the user understand state, consequence, and next action.

## Product UI Principles

Prefer specific domain language over promotional language.

A label should identify the thing. A button should name the action. An error should explain what failed and what the user can do.

Examples:

- `Send invoice` instead of `Continue`;
- `No unpaid invoices` plus a relevant next action instead of `Nothing here yet`;
- `You need the Billing Manager role to issue a refund` instead of `Access denied`;
- `The order was already submitted by another device` instead of `Something went wrong`.

## Voice

Define voice in `DESIGN.md` or product context:

- formal or conversational;
- technical or plain;
- calm or energetic;
- customer-facing or internal operations;
- regional terminology;
- capitalization and punctuation.

Keep terminology consistent across screens, API errors, notifications, and documentation.

## Buttons

Use verbs that describe the consequence:

- Create workspace
- Assign waiter
- Request check
- Save draft
- Send reminder
- Archive campaign

Use `Continue` only when the next step is obvious and naming the action would be misleading.

## Empty States

An empty state should answer:

1. what is absent;
2. why that may be normal;
3. what action is available.

Do not add a large illustration and motivational paragraph to every empty table.

## Errors

Separate:

- field validation;
- permission problem;
- business-rule conflict;
- network/transient failure;
- provider failure;
- unexpected internal error.

Include a stable machine-readable error code in APIs; present user-friendly wording in the interface.

Never expose secrets, stack traces, or internal provider details to end users.

## Status and Notifications

State what changed, which object changed, and whether user action is required. Avoid celebratory notifications for routine operations.

## Marketing Copy

Replace generic claims with:

- named audience;
- concrete problem;
- specific capability;
- evidence or mechanism;
- clear next step.

Do not invent metrics, customers, awards, testimonials, or compliance claims.

## AI-Slop Review

Flag vague phrases such as:

- revolutionary;
- seamless;
- cutting-edge;
- unlock your potential;
- transform your workflow;
- powerful platform;
- all-in-one solution.

They may remain only when supported by specific meaning and evidence.

## Completion Check

Review:

- terminology consistency;
- action clarity;
- permissions and destructive consequences;
- errors and recovery;
- empty/loading states;
- localization length and truncation risk;
- fake or unsupported claims;
- accessibility labels distinct from visual shorthand.
