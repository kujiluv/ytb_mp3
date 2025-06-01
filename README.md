# YouTube MP3 Downloader en Julia

Petit outil en Julia pour télécharger l'audio d'une vidéo YouTube directement en MP3.

---

## 🇫🇷 Version française

### Prérequis
- Julia installé (version 1.6 ou plus récente recommandée)
- yt-dlp installé et accessible dans le PATH
- ffmpeg installé et accessible dans le PATH

### Installation rapide
1. Clone ou télécharge le dossier.
2. Vérifie que `yt-dlp` et `ffmpeg` fonctionnent dans ton terminal (commande `yt-dlp --version` et `ffmpeg -version`).
3. Modifie le fichier `config.kuji` (ou crée le tien) pour changer le dossier de sortie, le format audio, la qualité, le nommage, etc.

### Utilisation
Dans le terminal, place-toi dans le dossier du projet, puis lance :

```bash
julia main.jl
```

Suis les instructions à l'écran :
- Colle l'URL YouTube à télécharger
- Indique le dossier de destination (ou laisse vide pour le dossier par défaut)
- Choisis le format audio (mp3, wav, flac, m4a, opus)

Le nom du fichier généré correspondra exactement au titre de la vidéo.
Un historique de tous tes téléchargements est enregistré dans `history.log`.

### Personnalisation
- Change tous les paramètres dans `config.kuji` (ou crée un autre fichier de config) :
  ```toml
  dir = "./output"
  default_audio_format = "mp3"
  default_quality = "192k"
  default_filename_template = "%(title)s.%(ext)s"
  default_download_mode = "audio"
  default_history_file = "history.log"
  ```
- Tu peux utiliser un autre fichier de config (ex : `config.monprofil`) en le précisant au lancement.

### Structure avancée
- Le code principal est dans `main.jl` (entrée utilisateur, config)
- Toutes les fonctions utilitaires sont dans `submain.jl` (logique de téléchargement, barre de progression, etc.)
- Le nom du fichier téléchargé est toujours le titre exact de la vidéo YouTube.

### Pourquoi Julia ?
Parce que c'est rapide, fun, et ça change des scripts Python !

---

## 🇬🇧 English version

### Prerequisites
- Julia installed (version 1.6 or newer recommended)
- yt-dlp installed and available in your PATH
- ffmpeg installed and available in your PATH

### Quick setup
1. Clone or download this folder.
2. Check that `yt-dlp` and `ffmpeg` work in your terminal (`yt-dlp --version` and `ffmpeg -version`).
3. Edit `config.kuji` (or create your own) if you want to change the output folder, audio format, quality, naming, etc.

### Usage
Open a terminal in the project folder, then run:

```bash
julia main.jl
```

Follow the instructions:
- Paste the YouTube URL you want to download
- Enter the destination folder (or leave blank for the default)
- Choose the audio format (mp3, wav, flac, m4a, opus)

The generated file will have exactly the same name as the video title.
All your downloads are logged in `history.log`.

### Customization
- Change all parameters in `config.kuji` (or create another config file):
  ```toml
  dir = "./output"
  default_audio_format = "mp3"
  default_quality = "192k"
  default_filename_template = "%(title)s.%(ext)s"
  default_download_mode = "audio"
  default_history_file = "history.log"
  ```
- You can use another config file (e.g. `config.myprofile`) by specifying it at launch.

### Advanced structure
- The main logic is in `main.jl` (user input, config)
- All utility functions are in `submain.jl` (download logic, progress bar, etc.)
- The downloaded file name is always the exact YouTube video title.

### Why Julia?
Because it's fast, fun, and it's a nice change from Python scripts!

---


