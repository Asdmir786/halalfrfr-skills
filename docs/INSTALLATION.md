# Installation

HalalFrFr Skills contains 44 frontend + full-stack skills and 8 official GSAP companion skills, for 52 skills in total.

## Recommended global setup

From the repository root:

    pwsh ./scripts/setup.ps1

This installs into:

`~/.agents/skills`

## Direct installer

Global:

    pwsh ./scripts/install.ps1 -Target AgentsUser -Mode Copy

Project:

    pwsh ./scripts/install.ps1 -Target AgentsProject -ProjectPath "C:\path\to\project"

Cursor global:

    pwsh ./scripts/install.ps1 -Target CursorUser -Mode Copy

Cursor project:

    pwsh ./scripts/install.ps1 -Target CursorProject -ProjectPath "C:\path\to\project"

## Existing installations

The unified installer uses:

`.halalfrfr-skills.json`

Legacy `.halalfrfr-frontend-skills.json` installations are recognized during migration and removed after a successful unified installation.

Unrelated skill directories are not removed.

If an unmanaged skill has the same name as a HalalFrFr skill, installation stops rather than silently overwriting it.

Use `-Force` only after intentionally reviewing or backing up those conflicts.

The GSAP skills are included in the same installation. If they were previously installed separately, their names can appear as unmanaged collisions. Back up the existing copies and compare them with the pinned source before using `-Force`; the installer does not automatically adopt or overwrite them.

## Updates

    git pull --ff-only
    pwsh ./scripts/check.ps1
    pwsh ./scripts/install.ps1 -Target AgentsUser -Mode Copy

## Uninstall

    pwsh ./scripts/uninstall.ps1 -Target AgentsUser

Only skills recorded in the unified HalalFrFr installation manifest are removed.
