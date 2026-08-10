# shadcn Project Detection

Inspect before changing anything.

## Configuration

Look for:

- components.json
- package.json
- global CSS
- utility helper
- aliases
- installed component source

## Base Detection

Inspect actual component imports.

Do not infer the base from old shadcn conventions.

## Paths

Use configured aliases and paths.

Do not assume:

- components/ui
- lib/utils
- app/globals.css

without checking the project.

## Monorepo

Identify which workspace owns:

- configuration
- UI components
- CSS
- consuming application

## Principle

The project is the source of truth.
