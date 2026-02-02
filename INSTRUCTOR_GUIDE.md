# Instructor Guide - Formation Shell (6h)

Date: use your local calendar. Total face-to-face time: 6h.

## Daily plan (fixed timeboxes)

Morning (3h30) 09:00-12:30
- 09:00-09:10 Welcome, objectives, logistics
- 09:10-09:25 Roundtable (name, context, personal objective)
- 09:25-09:35 Icebreaker (Terminal Bingo or favorite/most-hated command)
- 09:35-09:50 How the day works: sprint cadence, repos, rules, Definition of Done
- 09:50-10:00 Vi crash course (minimal): i / Esc / :wq / :q! / / / ? / dd / yy / p / u

Sprints
- Sprint 1 (10:00-10:45) Navigation, files, man/help (step01)
- Break (10:45-10:55)
- Sprint 2 (10:55-11:45) Redirections, pipes, grep, head/tail, sort/uniq (step02)
- Sprint 3 (11:45-12:25) find, globbing/quoting, env vars (step03)
- 12:25-12:30 Mini-retro + parking lot

Lunch (off-clock) 12:30-13:30

Afternoon (2h30) 13:30-16:00
- Sprint 4 (13:30-14:20) Bash scripting basics (step04)
- Break (14:20-14:30)
- Sprint 5 (14:30-15:20) Loops/conditions/functions + legacy 02-for-loop rework (step05)
- Sprint 6 (15:20-15:50) Interactive script + legacy 01-add_interactive rework (step06)
- 15:50-16:00 Final quiz + wrap-up + next steps

## Sprint cadence (repeatable)

Each sprint = goal + demo + practice + correction + check + mini-retro.
- Goal (2 min): clear objective for the sprint
- Demo (5-10 min): facilitator shows 1-2 key commands or patterns
- Practice (20-35 min): participants complete the step
- Correction (10-15 min): walk through solution and common errors
- Check (2-5 min): run provided check script
- Mini-retro (2-3 min): quick feedback, what to park for later

## Material checklist

- Projector + HDMI/USB-C adapter
- Whiteboard or shared notes (parking lot)
- Stable Wi-Fi (optional, no external dependencies required)
- Local terminal for facilitator with bash
- Zip tools installed (for packaging)

## Pre-session checklist

- `git submodule update --init --recursive`
- Run `./scripts/bootstrap.sh`
- Open `guide/steps/` and `workshop/steps/` in editor
- Prepare sample demo files (use `workshop/steps/step01/starter`)
- Verify checks run for step01 and step02

## Plan B (issues)

- No network: training still works, no external dependency.
- Rights problems on machines: run from user home, avoid system folders.
- Missing `zip`: use `tar` fallback in `package_participant.sh`.
- Mixed skill levels: pair strong with less confident; offer fast-track variants.

## Sprint runbooks

### Sprint 1 (10:00-10:45) - Navigation, files, man/help (step01)

Objectives
- Navigate with `pwd`, `ls`, `cd`
- Understand relative vs absolute paths
- Use `man` and `--help`

Demo (5-10 min)
- `pwd`, `ls -la`, `cd ..`, `cd -`
- `man ls`, `ls --help`, `man man`

Instructions
- Open `workshop/steps/step01/README.md`
- Work in the provided `starter/maze` tree
- Write `answers.txt` as instructed

Watch points / typical errors
- Confusion between relative and absolute paths
- Forgetting quotes around paths with spaces

Useful phrases
- "If you are lost, run `pwd` and go up one level with `cd ..`."
- "Use `man` as a habit; it is your local search engine."

If group is fast
- Add `tree`-like listing using `find` + `sed`
- Ask them to explain the output of `ls -la`

If group is slow
- Pair participants
- Provide the exact path to the clue file

### Sprint 2 (10:55-11:45) - Redirections, pipes, filters (step02)

Objectives
- Use `>`, `>>`, `2>`, `2>&1`
- Build pipelines with `|`
- Filter with `grep`, `cut`, `sort`, `uniq`, `head`, `tail`

Demo
- `cat file | grep "ERROR" | cut -d' ' -f2 | sort | uniq -c`
- Redirect output to file

Instructions
- Use the provided `starter/log.txt`
- Produce `filtered.txt` per criteria
- Run `checks/check.sh`

Typical errors
- Confusing stdout vs stderr
- Using `uniq` without `sort`

Useful phrases
- "Build your pipeline step by step and echo intermediate results."

Variations
- Add `tee` to show and save

### Sprint 3 (11:45-12:25) - find, globbing, quoting, env (step03)

Objectives
- Use `find` and simple predicates
- Handle spaces with quoting
- Read and set env vars

Demo
- `find . -type f -name "*.cfg"`
- `export PROJECT_NAME="alpha"`
- `echo "$PATH"`

Instructions
- Use the `starter/files` tree
- Create `found.txt` and `env.txt`

Typical errors
- Unquoted paths
- Using single quotes when expansion is needed

### Sprint 4 (13:30-14:20) - Scripting basics (step04)

Objectives
- Shebang, variables, positional params
- Exit codes, `test` / `[ ]`, simple `if`

Demo
- Minimal script + `chmod +x`
- `if [ -z "$1" ]; then ... fi`

Instructions
- Write `greet.sh` and `check_env.sh`
- Run checks

### Sprint 5 (14:30-15:20) - Loops/conditions/functions (step05)

Objectives
- Use `for` and `while`
- Use `case`
- Refactor legacy loop script

Demo
- `for f in *.txt; do ...; done`
- `case "$1" in ...)` usage

Instructions
- Complete `cmp_dir.sh` based on starter
- Run checks

Typical errors
- Missing quotes around variables
- Using `for f in $(ls ...)` instead of globbing

### Sprint 6 (15:20-15:50) - Interactive script (step06)

Objectives
- `read`, validation, simple menu flow
- Integrate command-line flags

Demo
- `read -r input`
- `-i/--interactive` style flag

Instructions
- Complete `system_page.sh`
- Run checks (non-interactive + interactive via input pipe)

Typical errors
- Blocking reads (no stdin)
- Writing output to wrong file

## Final quiz + wrap-up (15:50-16:00)

- Run `guide/quizzes/final_quiz.md`
- Collect 1 key takeaway per participant
- Share next steps: daily CLI practice, build a useful script

## Definition of Done (per step)

- Guide read
- Exercise completed
- Check script passes
- Quick self-explanation of what was learned
- 1-minute mini retro
