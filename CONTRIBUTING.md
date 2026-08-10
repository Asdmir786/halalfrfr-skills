# Contributing

Contributions should preserve the focused-skill architecture.

## Skill Rules

Each canonical skill should:

- do one focused job
- contain `SKILL.md`
- use a folder name matching its frontmatter `name`
- have a concise, front-loaded `description`
- declare when it should and should not trigger
- avoid duplicating another specialist's workflow
- place deeper documentation under `references/`

## Description Budget

Keep individual descriptions under 240 characters when practical.

The repository validator also limits the combined description budget to preserve discovery headroom.

## Generated Files

Do not manually maintain:

- `skills/frontend-master/references/generated-skill-registry.md`
- `skills/frontend-resource-intelligence/references/catalog/`
- `skills/frontend-resource-intelligence/references/catalog.csv`
- `skills/frontend-resource-intelligence/references/catalog.json`
- `skills/frontend-resource-intelligence/references/RESOURCE_POLICY.md`
- `skills/frontend-resource-intelligence/references/MANIFEST.csv`

Edit their canonical sources and run:

    pwsh ./scripts/sync-all.ps1

## Validation

Before submitting a change:

    pwsh ./scripts/check.ps1

## External Resources

Do not vendor third-party code, assets, databases, or documentation without confirmed redistribution rights.

Resource links should include original usage guidance rather than copied third-party content.
