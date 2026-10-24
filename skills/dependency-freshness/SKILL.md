---
name: dependency-freshness
description: Select, install, and upgrade current stable compatible versions for TypeScript, React, Next.js, Tailwind, ESLint, Node, NestJS, Laravel, Prisma, and other dependencies. Verify official release and compatibility data, prefer active LTS runtimes, pin/lock versions, review migrations, security, and regressions, and never upgrade blindly.
metadata:
  family: halalfrfr
  version: "4.0.0"
---


# Dependency Freshness

## Native Planning

For greenfield, broad, risky, cross-layer, or materially ambiguous work, use the host application's native Plan Mode before editing. Let the native planner inspect evidence, ask only material clarifications, and produce a reviewable plan. Do not replace it with a separate scripted questionnaire. For a focused, reversible task with sufficient context, proceed directly after inspection.


`Latest` is not a design decision. Use the newest stable set that is mutually compatible with the product, runtime, hosting, plugins, and browser requirements.

## New Projects

Before scaffolding:

1. verify current stable framework/runtime versions from official sources;
2. verify peer dependencies and supported runtime/browser ranges;
3. prefer an active LTS runtime for production;
4. choose current stable TypeScript and ESLint configuration supported by the framework/tooling;
5. use exact lockfiles and record package manager;
6. avoid unnecessary dependencies;
7. run build, type, lint, tests, and security checks.

Do not hardcode a version from this skill. Versions change.

## Existing Projects

Inspect:

- package/composer manifests and lockfiles;
- runtime versions;
- framework adapters/plugins;
- deprecated configuration;
- security advisories;
- CI/deployment images;
- database/ORM migration implications;
- test coverage.

Separate:

- patch/minor security updates;
- normal compatible upgrades;
- major migrations;
- framework/runtime changes.

Do not combine unrelated major upgrades in one unreviewable change.

## Compatibility Before Novelty

Examples of consequential checks:

- Next.js and React compatibility;
- TypeScript support in framework/build/test tooling;
- ESLint flat-config requirements and plugin compatibility;
- Tailwind browser requirements and plugin ecosystem;
- Node support for framework, native modules, and deployment;
- Prisma client/engine and migration changes;
- Laravel/PHP/composer package support;
- NestJS adapters and libraries.

Use official migration guides and codemods when available, then inspect their changes.

## Current Stable-ish Policy

Prefer:

- stable release channels for production;
- active LTS Node rather than the newest Current release;
- current security-patched framework versions;
- exact or controlled version ranges plus a committed lockfile;
- automated update tooling that opens reviewable changes;
- staged upgrades with rollback.

Use canary, RC, beta, or nightly only for a documented need and explicit approval.

## Security and Supply Chain

Review:

- known vulnerabilities;
- install/postinstall scripts;
- package provenance;
- maintainership and release health;
- transitive dependency impact;
- secrets in registry configuration;
- agent-skill hooks/scripts before installation.

A dependency audit may contain false positives or unreachable code; investigate severity and exploitability instead of blindly forcing incompatible overrides.

## Upgrade Workflow

1. document baseline commands and passing tests;
2. upgrade one coherent layer;
3. apply official migration guidance;
4. inspect config and generated diffs;
5. fix types/lint/build/tests;
6. test critical user flows and deployment;
7. scan dependencies/security;
8. record breaking changes and rollback.

## Report

State:

- old and selected versions;
- official compatibility evidence;
- breaking changes addressed;
- commands/tests run;
- remaining ecosystem incompatibility;
- whether the upgrade is safe to merge/deploy.
