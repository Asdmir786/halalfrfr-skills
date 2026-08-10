# Distribution

This repository is the canonical authoring source for HalalFrFr's Frontend Skills.

## Local Agent Skills

For interactive local installation use:

`./scripts/setup.ps1`

For automation or explicit target selection use:

`./scripts/install.ps1`

This is suitable for:

- personal development
- repository-local workflows
- Cursor
- Codex
- other Agent Skills-compatible environments

## Multi-Skill Distribution

OpenAI's current guidance distinguishes local/repository skill discovery from reusable multi-skill distribution.

For OpenAI-specific packaged distribution, the collection can later be wrapped as a plugin while keeping these specialist `SKILL.md` files as the underlying skill definitions.

The repository therefore keeps the skill folders independently valid and portable.

## No Automatic Package Dependencies

The repository does not install:

- React
- Next.js
- Tailwind
- GSAP
- Three.js
- shadcn
- testing libraries
- component libraries

The skills inspect the target project and select tooling according to context.

## External Resource Catalog

The resource catalog contains links, classifications, and original usage notes.

Presence in the catalog does not mean:

- automatic installation
- endorsement for every project
- ownership by this repository
- permission to redistribute third-party assets or code

## Generated References

Run:

`./scripts/sync-all.ps1`

before release so generated skill references match their canonical sources.

## Release Preflight

Before publishing:

1. run `./scripts/check.ps1`
2. inspect `git diff`
3. inspect resource provenance
4. confirm personal/private links are intended for public visibility
5. commit
6. push
