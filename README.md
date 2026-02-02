# Formation Shell (parent repo)

This parent repo orchestrates the training content and the facilitator runbook. It includes two submodules:

- `guide/` (participant guide and theory)
- `workshop/` (hands-on exercises, checks, solutions)

The `legacy/` folder contains source materials used only to write the training. Participants must never need it, and participant packaging must exclude it.

## Clone with submodules

```bash
git clone --recurse-submodules <REPO_URL>
```

If already cloned:

```bash
git submodule update --init --recursive
```

## Distribution modes

1) Participants clone only the content they need:
- `guide/`
- `workshop/`

2) Package a participant zip from this parent repo (excludes `legacy/` and optionally excludes `solutions/`):

```bash
./scripts/package_participant.sh
```

## Repo layout

- `INSTRUCTOR_GUIDE.md`: facilitator runbook (minute-by-minute)
- `PREREQUISITES.md`: requirements and quick checks
- `SETUP_PARTICIPANT.md`: self-serve setup guide
- `AGENTS.md`: architecture, conventions, rules, and workflow
- `scripts/`: bootstrap, packaging, and optional tagging helpers
