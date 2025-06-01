using TOML
include("submain.jl")

function read_config(path::String)
    return TOML.parsefile(path)
end

print("Config file (blank = config) :")
config_file = readline()
if isempty(config_file)
    config_file = "config.kuji"
end
config = read_config(config_file)

print("\033[38;2;255;105;180m"); println(raw" __  ___________    __  ______  ____")
print("\033[38;2;255;140;200m"); println(raw" \ \/ /_  __/ _ )  /  |/  / _ \|_  /")
print("\033[38;2;235;100;200m"); println(raw"  \  / / / / _  | / /|_/ / ___//_ < ")
print("\033[38;2;205;80;170m"); println(raw"  /_/ /_/ /____/ /_/  /_/_/  /____/ ")
print("\033[0m")

print("URL YouTube : ")
url = readline()
print("Folder install (blank = folder ./output) :")
dest = readline()
if isempty(dest)
    dest = get(config, "dir", "./output")
    println("\033[38;2;255;105;180mno folder specified, using default folder : $dest\033[0m")
end

if !isdir(dest)
    try
        mkpath(dest)
        println("create folder : $dest")
    catch
        println("error: cant create folder : $dest. please verify permissions or path.")
        exit(1)
    end
end

formats = ["mp3", "wav", "flac", "m4a", "opus"]
default_fmt = get(config, "default_audio_format", "mp3")
default_quality = get(config, "default_quality", "192k")
default_template = get(config, "default_filename_template", "%(title)s.%(ext)s")
default_mode = get(config, "default_download_mode", "audio")
history_file = get(config, "default_history_file", "history.log")

println("Choose audio format: [1] mp3 [2] wav [3] flac [4] m4a [5] opus (default: $default_fmt)")
fmt_choice = readline()
fmt = default_fmt
if !isempty(fmt_choice)
    idx = tryparse(Int, fmt_choice)
    if idx !== nothing && idx ≥ 1 && idx ≤ length(formats)
        fmt = formats[idx]
    end
end

youtube_to_mp3(url; output_dir=dest, audio_format=fmt, quality=default_quality, template=default_template, mode=default_mode, history_file=history_file)
