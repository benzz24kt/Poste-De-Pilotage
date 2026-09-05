# Guide de mise en ligne — Poste de pilotage

Trois fichiers dans ce dossier :
- `index.html` — le site complet (à ne pas renommer)
- `schema.sql` — la structure de la base de données, à coller une seule fois dans Supabase
- ce guide

Compte à peu près 15 minutes la première fois. Tout est gratuit pour cet usage.

## 1. Créer la base de données (Supabase)

1. Va sur [supabase.com](https://supabase.com), crée un compte gratuit.
2. Clique **New project**. Choisis un nom, un mot de passe pour la base (note-le quelque part), une région proche de toi. Clique **Create new project** et attends 1-2 minutes.
3. Dans le menu de gauche, clique **SQL Editor** puis **New query**.
4. Ouvre le fichier `schema.sql` fourni ici, copie tout son contenu, colle-le dans l'éditeur, clique **Run**.
5. Toujours dans le menu de gauche : **Project Settings** (icône engrenage) → **API**. Tu vois deux valeurs à copier quelque part :
   - **Project URL**
   - **anon public** (une longue clé)

## 2. Brancher le site sur la base

1. Ouvre `index.html` avec un éditeur de texte simple (Bloc-notes sur Windows, TextEdit en mode texte brut sur Mac, ou VS Code si tu l'as).
2. Cherche (Ctrl+F / Cmd+F) `REPLACE_WITH_YOUR_SUPABASE_URL` — remplace par ton **Project URL**, entre les guillemets.
3. Cherche `REPLACE_WITH_YOUR_SUPABASE_ANON_KEY` — remplace par ta clé **anon public**, entre les guillemets.
4. Enregistre le fichier (garde-le en `.html`).

## 3. Mettre le site en ligne (Netlify)

1. Va sur [app.netlify.com](https://app.netlify.com) et crée un compte gratuit (ça te permet de remettre à jour le même lien plus tard).
2. Une fois connecté, cherche le bouton **Add new site → Deploy manually**.
3. Fais glisser le dossier contenant `index.html` (juste ce fichier suffit) sur la zone de dépôt.
4. Au bout de quelques secondes, Netlify te donne une adresse du type `https://un-nom-genere.netlify.app`. C'est le lien de ton poste de pilotage.
5. (Optionnel) Dans **Site settings → Change site name**, tu peux choisir un nom plus simple à retenir/partager.

## 4. Premier lancement

1. Ouvre le lien Netlify. Comme aucun profil n'existe encore, la page te propose directement de créer le compte **Super Admin** — c'est toi, avec tous les droits (accès à tout + gestion des rôles et des comptes). Choisis ton prénom et un code à 4 chiffres, retiens-le.
2. Tu arrives sur le site complet, avec en plus un onglet **Panneau de contrôle** dans le menu (visible seulement par les admins).
3. Partage le lien Netlify à tes amis.

## 5. Quand un ami se connecte

1. Il ouvre le lien, clique **Créer un profil**, choisit un prénom et un code à 4 chiffres.
2. Son profil reste **en attente** tant que tu ne l'as pas validé.
3. Toi : menu → **Panneau de contrôle** → section **Membres & accès** → bouton **Approuver** sur sa ligne.
4. À sa première connexion réussie, il voit un petit questionnaire : **« Que souhaites-tu apprendre ? »** (Coding / Trading / Memecoin, un ou plusieurs choix). Ça ouvre automatiquement les onglets correspondants pour lui — s'il choisit les trois, il obtient le badge **Super Learner** dans le panneau de contrôle. Il arrive ensuite directement sur "Bonjour [prénom]" et son suivi Memecoin.
5. Depuis le panneau de contrôle, tu peux à tout moment changer son rôle (Membre / Admin / Super Admin) via le menu déroulant sur sa ligne, ou **fermer son compte** (il ne peut plus se connecter — bouton **Réactiver** pour revenir en arrière). Seul un **Super Admin** voit ces contrôles ; un simple Admin voit la liste des membres en lecture seule.

## 6. Suivre les trades de tes amis

Dans le **Panneau de contrôle**, section **Suivi des trades de l'équipe** : choisis un membre dans la liste pour voir ses statistiques et son journal complet, en lecture seule.

## 7. Qui est connecté, et en quelle langue

En haut à gauche du site (visible seulement pour les admins), un petit indicateur montre les initiales des personnes actuellement connectées et leur nombre — c'est indicatif, pas garanti à la seconde près.

Dans le menu (en bas), un bouton **FR / EN** permet à chacun de basculer l'interface et le contenu des cours en français ou en anglais, selon sa préférence. Ce choix est mémorisé par appareil.

## 8. Les cours

Les onglets **Coding Courses** et **Trading Courses** contiennent chacun 10 cours rédigés directement dans le site (texte + schéma + vidéo intégrée) — un membre n'a qu'à cliquer un cours dans la liste pour le lire, sans quitter la page. L'onglet **Memecoin** propose un bouton **Cours / Suivi** en haut : "Cours" donne les notes d'opération et le lexique, "Suivi" est le journal de trades existant.

## À savoir avant de partager le lien

Ce système fonctionne par prénom + code à 4 chiffres, sans e-mail ni mot de passe réel — pratique entre amis, mais **ce n'est pas un vrai système de sécurité**. La clé technique qui permet au site de parler à la base de données est visible dans le code de la page : quelqu'un de très curieux et un minimum technique pourrait, en théorie, lire ou modifier les données directement, sans passer par les codes à 4 chiffres. Pour un usage entre amis autour d'un suivi de trades papier (rien de réel, pas d'argent ni de clé de wallet en jeu), c'est largement suffisant. Ne mets jamais d'information sensible (vraie seed phrase, mot de passe d'un autre service, coordonnées bancaires) dans ce site.

## Pour mettre à jour le site plus tard

Si le fichier `index.html` est modifié (nouvelle fonctionnalité, correction), reviens sur ton site dans Netlify → **Deploys** → fais glisser le nouveau fichier au même endroit : le lien reste identique, seul le contenu change.
