# Migrations
For existing data distinguish additive/destructive change, plan nullable→backfill→constraint sequencing, preserve compatibility during staged rollout when needed, define rollback/forward-fix, verify assumptions before transformation, and avoid destructive resets outside disposable environments.
