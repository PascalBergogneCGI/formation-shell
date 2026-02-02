# AGENTS - Formation Shell Compass

This file keeps the repo architecture, conventions, and non-negotiable rules in one place.

## Architecture

Parent repo (this repo): orchestrates docs and packaging.
- `guide/` submodule: participant guide
- `workshop/` submodule: exercises and checks
- `legacy/`: internal sources only (never distributed)

## Non-negotiable rules

- `legacy/` is never required by participants.
- No participant doc may reference `legacy/`.
- Participant packaging must exclude `legacy/`.
- Exercises derived from legacy must be re-written and re-created in `workshop/`.

## Naming conventions

- Steps are `step01` ... `stepNN`
- Guide steps: `guide/steps/stepXX.md`
- Workshop steps: `workshop/steps/stepXX/`

## Definition of Done (a step)

A step is done when it has:
- Guide content (theory + examples + pitfalls + takeaway)
- Workshop exercise with objective, instructions, success criteria, timebox
- A runnable `checks/check.sh`
- A correction in `solutions/` or `instructor_solutions/`
- A short self-check or mini-quiz

## Submodule workflow

1) Commit and push changes in `guide/`
2) Commit and push changes in `workshop/`
3) Update parent submodule pointers
4) Commit parent changes
5) Tag the parent with `stepXX` if needed

## Tagging strategy (parent only)

Example commands:

```bash
# After updating submodules
cd /path/to/formation-shell

git add guide workshop
git commit -m "Update submodules for step03"

git tag -a step03 -m "step03 complete"

git push --tags
```


## Packaging rules

- `scripts/package_participant.sh` must exclude `legacy/`.
- Solutions are excluded by default; use `--with-solutions` to include them.
