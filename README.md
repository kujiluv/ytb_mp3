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
3. Modifie le fichier `config.toml` si tu veux changer le dossier de sortie ou le format audio.

### Utilisation
Dans le terminal, place-toi dans le dossier du projet, puis lance :

```bash
julia main.jl
```

Suis les instructions à l'écran :
- Colle l'URL YouTube à télécharger
- Indique le dossier de destination (ou laisse vide pour le dossier par défaut)

Le nom du fichier MP3 généré s'affichera à la fin.

### Personnalisation
- Change le dossier de sortie ou le format par défaut dans `config.toml` :
  ```toml
  dir = "./output"
  default_audio_format = "mp3"
  ```

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
3. Edit `config.toml` if you want to change the output folder or audio format.

### Usage
Open a terminal in the project folder, then run:

```bash
julia main.jl
```

Follow the instructions:
- Paste the YouTube URL you want to download
- Enter the destination folder (or leave blank for the default)

The name of the generated MP3 file will be displayed at the end.

### Customization
- Change the output folder or default format in `config.toml`:
  ```toml
  dir = "./output"
  default_audio_format = "mp3"
  ```

### Why Julia?
Because it's fast, fun, and it's a nice change from Python scripts!

---


