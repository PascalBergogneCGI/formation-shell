# Guide Animateur - Formation Shell (6h)

Date : utilisez votre calendrier. Temps en face-à-face : 6h.

## Planning de la journée (timeboxes fixes)

Matin (3h30) 09:00-12:30
- 09:00-09:10 Accueil, objectifs, logistique
- 09:10-09:25 Tour de table (prénom, contexte, objectif perso)
- 09:25-09:35 Icebreaker (Terminal Bingo ou commande préférée/haïe)
- 09:35-09:50 Comment la journée fonctionne : cadence en sprints, repos, règles, Definition of Done
- 09:50-10:00 Crash course vi (minimum vital) : i / Esc / :wq / :q! / / / ? / dd / yy / p / u

Sprints
- Sprint 1 (10:00-10:45) Navigation, fichiers, man/help (step01)
- Pause (10:45-10:55)
- Sprint 2 (10:55-11:45) Redirections, pipes, grep, head/tail, sort/uniq (step02)
- Sprint 3 (11:45-12:25) find, globbing/quoting, variables d'environnement (step03)
- 12:25-12:30 Mini-rétro + parking lot

Déjeuner (hors 6h) 12:30-13:30

Après-midi (2h30) 13:30-16:00
- Sprint 4 (13:30-14:20) Bases du scripting bash (step04)
- Pause (14:20-14:30)
- Sprint 5 (14:30-15:20) Boucles/conditions/fonctions + reprise legacy 02-for-loop (step05)
- Sprint 6 (15:20-15:50) Script interactif + reprise legacy 01-add_interactive (step06)
- 15:50-16:00 Quiz final + wrap-up + prochaines étapes

## Cadence d'un sprint

Chaque sprint = objectif + démo + pratique + correction + check + mini-rétro.
- Objectif (2 min) : but clair
- Démo (5-10 min) : 1-2 commandes ou patterns clés
- Pratique (20-35 min) : exercices
- Correction (10-15 min) : correction + erreurs typiques
- Check (2-5 min) : exécuter le script de validation
- Mini-rétro (2-3 min) : feedback rapide

## Checklist matériel

- Projecteur + adaptateur HDMI/USB-C
- Tableau ou notes partagées (parking lot)
- Wi-Fi stable (optionnel)
- Terminal local bash pour l'animateur
- Outil zip disponible (packaging)

## Checklist avant session

- `git submodule update --init --recursive`
- Exécuter `./scripts/bootstrap.sh`
- Ouvrir `guide/steps/` et `workshop/steps/`
- Préparer quelques fichiers de démo
- Vérifier les checks step01 et step02

## Plan B (problèmes)

- Pas de réseau : OK, pas de dépendance externe.
- Problèmes de droits : travailler dans le home.
- Pas de `zip` : le script génère un tar.gz.
- Niveaux hétérogènes : binômes + variantes rapides.

## Runbooks de sprint

### Sprint 1 (10:00-10:45) - Navigation, fichiers, man/help (step01)

Objectifs
- Naviguer avec `pwd`, `ls`, `cd`
- Comprendre chemins relatifs/absolus
- Utiliser `man` et `--help`

Démo
- `pwd`, `ls -la`, `cd ..`, `cd -`
- `man ls`, `ls --help`, `man man`

Consignes
- Ouvrir `workshop/steps/step01/README.md`
- Travailler dans `starter/maze`
- Écrire `answers.txt` selon l'énoncé

Erreurs typiques
- Confusion chemins relatifs/absolus
- Oubli des guillemets sur chemins avec espaces

Phrases utiles
- "Si vous êtes perdu, faites `pwd` puis `cd ..`."
- "Le `man` est votre moteur de recherche local."

Variantes rapides
- Reproduire `tree` avec `find` + `sed`

Variantes lentes
- Donner le chemin exact du fichier indice

### Sprint 2 (10:55-11:45) - Redirections, pipes, filtres (step02)

Objectifs
- `>`, `>>`, `2>`, `2>&1`
- Pipelines `|`
- `grep`, `cut`, `sort`, `uniq`, `head`, `tail`

Démo
- `cat file | grep ERROR | cut -d' ' -f3 | sort | uniq -c`
- Rediriger sortie vers fichier

Consignes
- Utiliser `starter/log.txt`
- Produire `filtered.txt`
- Lancer `checks/check.sh`

Erreurs typiques
- Confusion stdout/stderr
- `uniq` sans `sort`

### Sprint 3 (11:45-12:25) - find, globbing, quoting, env (step03)

Objectifs
- `find` et prédicats
- Quoting sûr
- Variables d'environnement

Démo
- `find . -type f -name "*.cfg"`
- `export PROJECT_NAME="alpha"`
- `echo "$PATH"`

Consignes
- Utiliser `starter/files`
- Créer `found.txt` et `env.txt`

Erreurs typiques
- Chemins non quotés
- Mauvais usage des quotes

### Sprint 4 (13:30-14:20) - Scripting (step04)

Objectifs
- Shebang, variables, paramètres
- Exit codes, `test` / `[ ]`, `if`

Démo
- Script minimal + `chmod +x`
- `if [ -z "$1" ]; then ... fi`

Consignes
- Écrire `greet.sh` et `check_env.sh`
- Lancer les checks

### Sprint 5 (14:30-15:20) - Boucles/conditions/fonctions (step05)

Objectifs
- `for`, `while`
- `case`
- Refactor d'un script

Démo
- `for f in *.txt; do ...; done`
- `case "$1" in ...)`

Consignes
- Compléter `cmp_dir.sh`
- Lancer les checks

Erreurs typiques
- Variables non quotées
- `for f in $(ls ...)` au lieu du glob

### Sprint 6 (15:20-15:50) - Script interactif (step06)

Objectifs
- `read`, validation, menu simple
- Intégrer flags CLI

Démo
- `read -r input`
- `-i/--interactive`

Consignes
- Compléter `system_page.sh`
- Lancer les checks (mode interactif via input pipe)

Erreurs typiques
- `read` bloquant sans stdin
- Écriture dans le mauvais fichier

## Quiz final + wrap-up (15:50-16:00)

- `guide/quizzes/final_quiz.md`
- 1 takeaway par participant
- Prochaines étapes : pratique quotidienne, script utile

## Definition of Done (par step)

- Guide lu
- Exercice terminé
- Check OK
- Explication rapide de l'apprentissage
- Mini-rétro


## Fil conducteur (script de monitoring VM)

Tout au long de la journée, les steps construisent un script unique de monitoring de VM.
Le script final sera en bash (pas de HTML) et intégrera :
- collecte d'infos (uptime, load, disque, mémoire)
- parsing avec awk
- boucles, conditions, fonctions
- menu interactif

Chaque step ajoute une brique, puis le projet final assemble tout.
