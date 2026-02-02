# Participant Setup (self-serve)

This guide prepares you for the training without an instructor.

## 1) Get the repositories

Option A: you receive a participant package zip.
- Unzip it into a working folder.

Option B: clone the two repos directly:

```bash
git clone <GUIDE_REPO_URL>
git clone <WORKSHOP_REPO_URL>
```

## 2) Verify your environment

```bash
bash --version

git --version

which awk
which sed
which grep
```

## 3) Open the materials

- Read `guide/README.md`
- Follow the steps in `guide/steps/`
- Do exercises in `workshop/steps/`

## Troubleshooting

- "command not found": install the tool or check your PATH
- Permission denied: add execute right with `chmod +x <script>`
- If a check fails, open the step README and re-read the criteria
