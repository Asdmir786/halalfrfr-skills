# Installation

HalalFrFr's Frontend Skills can be installed as user-level or project-level Agent Skills.

## Recommended Default

From the repository root:

    pwsh ./scripts/install.ps1

The default target is the user-level `.agents/skills` directory and the default mode is `Copy`.

## Installation Targets

### Cross-agent user installation

    pwsh ./scripts/install.ps1 -Target AgentsUser

### Cross-agent project installation

    pwsh ./scripts/install.ps1 -Target AgentsProject -ProjectPath "C:\path\to\project"

### Cursor user installation

    pwsh ./scripts/install.ps1 -Target CursorUser

### Cursor project installation

    pwsh ./scripts/install.ps1 -Target CursorProject -ProjectPath "C:\path\to\project"

## Copy vs Link

Copy mode:

    pwsh ./scripts/install.ps1 -Mode Copy

Link mode:

    pwsh ./scripts/install.ps1 -Mode Link

Copy is the safest default.

Link mode is useful during active development because updates to this repository become visible through the symbolic links.

On platforms where symbolic-link creation requires additional permission, use Copy mode.

## Updating an Existing HalalFrFr Installation

Run the same install command again.

The installer records managed skills in:

`.halalfrfr-frontend-skills.json`

Only skills recorded as managed by this package are automatically replaced.

If a same-named unmanaged skill already exists, installation stops instead of silently overwriting it.

Use `-Force` only when you intentionally want to replace that conflicting skill.

## Uninstall

Default user installation:

    pwsh ./scripts/uninstall.ps1

Other targets use the same target selection:

    pwsh ./scripts/uninstall.ps1 -Target CursorUser

The uninstaller removes only the skills listed in the HalalFrFr installation manifest.

It does not delete unrelated skills.

## Repository Development

After changing resources or skill descriptions:

    pwsh ./scripts/sync-all.ps1

Then validate:

    pwsh ./scripts/check.ps1
