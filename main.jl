using TOML

function read_config(path::String)
    return TOML.parsefile(path)
end

config = read_config("config.toml")

print("\033[38;2;255;105;180m"); println(raw" __  ___________    __  ______  ____")
print("\033[38;2;255;140;200m"); println(raw" \ \/ /_  __/ _ )  /  |/  / _ \|_  /")
print("\033[38;2;235;100;200m"); println(raw"  \  / / / / _  | / /|_/ / ___//_ < ")
print("\033[38;2;205;80;170m"); println(raw"  /_/ /_/ /____/ /_/  /_/_/  /____/ ")
print("\033[0m")

print("URL YouTube : ")
url = readline()
print("Folder install ( blank = output folder ) :")
dest = readline()
if isempty(dest)
    dest = get(config, "dir", ".")
end

if !isdir(dest)
    try
        mkpath(dest)
    catch
        println("Erreur : impossible de créer le dossier de sortie : $dest")
        exit(1)
    end
end

default_audio_format = get(config, "default_audio_format", "mp3")

function youtube_to_mp3(url::String; output_dir::String = ".", audio_format::String = "mp3")
    output_template = joinpath(output_dir, "%(title)s.%(ext)s")
    cmd = `yt-dlp --extract-audio --audio-format $audio_format -o $output_template --print after_move:filepath $url --quiet`
    try
        filename = strip(read(cmd, String))
        if isfile(filename)
            println(basename(filename))
        else
            println(basename(filename))
        end
    catch e
        println("Erreur lors du téléchargement : ", e)
    end
end

youtube_to_mp3(url; output_dir=dest, audio_format=default_audio_format)


# kuji luv u </3