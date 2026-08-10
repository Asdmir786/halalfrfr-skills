# Resource Intelligence Architecture

The root resources directory is the canonical editable dataset.

The frontend-resource-intelligence skill contains a generated self-contained copy of that resource knowledge under its references directory.

Do not manually maintain both copies.

After changing the root resource catalog, run:

.\scripts\sync-resource-intelligence.ps1

## Source of Truth

Maintain:

- resources\catalog.csv
- resources\catalog.json
- categorized resource Markdown files
- docs\RESOURCE_POLICY.md

Then run the synchronization script.

## Why the Generated Copy Exists

A distributed Agent Skill should remain usable after being copied or installed independently from this repository.

The frontend-resource-intelligence skill therefore carries all references required for its own operation.

This keeps the skill portable while allowing the repository to maintain one canonical resource dataset.
