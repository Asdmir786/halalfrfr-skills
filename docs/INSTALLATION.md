# Installation

HalalFrFr's Frontend Skills includes both an interactive setup wizard and a non-interactive installer.

## Recommended Setup

From the repository root:

    pwsh ./scripts/setup.ps1

The wizard asks where the skills should be available.

### Option 1 - Global: Cursor + Codex

Recommended for most users.

Installs into:

`~/.agents/skills`

Use this when you want HalalFrFr available across your projects.

### Option 2 - One Project: Cursor + Codex

Installs into:

`<project>/.agents/skills`

The wizard asks for the project path.

Use this when HalalFrFr should only apply to one repository or workspace.

### Option 3 - Cursor-Specific

Advanced users may install into:

Global:

`~/.cursor/skills`

Project:

`<project>/.cursor/skills`

The standard Global and Project choices are preferred when the same installation should be usable by multiple Agent Skills-compatible environments.

## Non-Interactive Installer

Automation, CI, scripting, and advanced users can call `install.ps1` directly.

### Global

    pwsh ./scripts/install.ps1 -Target AgentsUser

### Project

    pwsh ./scripts/install.ps1 -Target AgentsProject -ProjectPath "C:\path\to\project"

### Cursor Global

    pwsh ./scripts/install.ps1 -Target CursorUser

### Cursor Project

    pwsh ./scripts/install.ps1 -Target CursorProject -ProjectPath "C:\path\to\project"

## Copy vs Link

The interactive setup uses Copy mode for the safest default behavior.

Direct installation can use:

    pwsh ./scripts/install.ps1 -Mode Copy

or:

    pwsh ./scripts/install.ps1 -Mode Link

Link mode is useful during development because repository updates become visible through the symbolic links.

If symbolic-link creation is unavailable on the machine, use Copy mode.

## Updating HalalFrFr

For a Copy-mode installation:

    git pull
    pwsh ./scripts/check.ps1
    pwsh ./scripts/install.ps1 -Target AgentsUser -Mode Copy

The installer maintains:

`.halalfrfr-frontend-skills.json`

inside the selected skills root.

Previously managed HalalFrFr skills can therefore be updated safely.

A conflicting same-named skill that is not managed by HalalFrFr is not silently overwritten unless `-Force` is explicitly supplied.

## Uninstall

Global cross-agent installation:

    pwsh ./scripts/uninstall.ps1 -Target AgentsUser

Cursor global installation:

    pwsh ./scripts/uninstall.ps1 -Target CursorUser

Project installations use the corresponding project target and project path.

The uninstaller removes only skills recorded in the HalalFrFr installation manifest.

## Development

After changing canonical resources or skill metadata:

    pwsh ./scripts/sync-all.ps1

Run the full repository checks:

    pwsh ./scripts/check.ps1
