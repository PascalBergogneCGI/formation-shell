# Préparation Participant (autonome)

Ce guide permet de se préparer sans animateur.

## 1) Récupérer les repos

Option A : vous recevez un zip participant.
- Dézippez dans un dossier de travail.

Option B : cloner les deux repos :

```bash
git clone <GUIDE_REPO_URL>
git clone <WORKSHOP_REPO_URL>
```

## 2) Vérifier l'environnement

```bash
bash --version

git --version

which awk
which sed
which grep
```

## 3) Ouvrir les supports

- Lire `guide/README.md`
- Suivre `guide/steps/`
- Faire les exercices `workshop/steps/`

## Dépannage

- "command not found" : vérifier PATH ou installer l'outil
- "permission denied" : `chmod +x <script>`
- Si un check échoue, relire les critères
