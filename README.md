# Formation Shell (repo parent)

Ce repo parent orchestre les contenus et le runbook animateur. Il inclut deux submodules :

- `guide/` (supports participants et théorie)
- `workshop/` (exercices, checks, solutions)

Le dossier `legacy/` contient des sources internes utilisées uniquement pour rédiger la formation. Les participants ne doivent jamais en dépendre, et le packaging participant doit l'exclure.

## Cloner avec submodules

```bash
git clone --recurse-submodules <REPO_URL>
```

Si déjà cloné :

```bash
git submodule update --init --recursive
```

## Modes de distribution

1) Les participants clonent uniquement ce dont ils ont besoin :
- `guide/`
- `workshop/`

2) Packaging participant depuis ce repo parent (exclut `legacy/` et peut exclure `solutions/`) :

```bash
./scripts/package_participant.sh
```

## Structure

- `INSTRUCTOR_GUIDE.md` : runbook animateur (minute par minute)
- `PREREQUISITES.md` : prérequis et checks rapides
- `SETUP_PARTICIPANT.md` : préparation autonome
- `AGENTS.md` : architecture, conventions, règles, workflow
- `scripts/` : bootstrap, packaging, tagging
