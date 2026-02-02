# AGENTS - Boussole Formation Shell

Ce fichier fixe l'architecture, les conventions et les règles non négociables.

## Architecture

Repo parent (ce repo) : orchestration et packaging.
- `guide/` submodule : supports participants
- `workshop/` submodule : exercices et checks
- `legacy/` : sources internes uniquement (jamais distribuées)

## Règles non négociables

- `legacy/` n'est jamais requis par les participants.
- Aucun document participant ne référence `legacy/`.
- Le packaging participant exclut `legacy/`.
- Les exos issus de legacy sont réécrits dans `workshop/`.

## Conventions de nommage

- Steps : `step01` ... `stepNN`
- Guide : `guide/steps/stepXX.md`
- Workshop : `workshop/steps/stepXX/`

## Definition of Done (un step)

Un step est "done" s'il a :
- Contenu guide (théorie + exemples + pièges + à retenir)
- Exercice workshop (objectif, consignes, critères, temps)
- `checks/check.sh` exécutable
- Correction dans `solutions/` ou `instructor_solutions/`
- Mini-quiz ou auto-check rapide

## Workflow submodules

1) Commit/push dans `guide/`
2) Commit/push dans `workshop/`
3) Bump submodules dans le parent
4) Commit parent
5) Tag `stepXX` si besoin

## Stratégie de tags (parent)

```bash
cd /path/to/formation-shell

git add guide workshop
git commit -m "Update submodules for step03"

git tag -a step03 -m "step03 complete"

git push --tags
```

## Règles de packaging

- `scripts/package_participant.sh` exclut `legacy/`.
- Les solutions sont exclues par défaut ; `--with-solutions` pour inclure.
