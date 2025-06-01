using Dates

function show_progress_bar(pct)
    width = 40
    fill = round(Int, pct * width)
    empty = width - fill
    bar = repeat("█", fill) * repeat("─", empty)
    print("\r[", bar, "] ", lpad(round(Int, pct*100),3), "%")
    flush(stdout)
end

function youtube_to_mp3(url::String; output_dir::String = ".", audio_format::String = "mp3", quality::String = "192k", template::String = "%(title)s.%(ext)s", mode::String = "audio", history_file::String = "history.log")
    output_template = joinpath(output_dir, template)
    mode_flag = mode == "video" ? "" : "--extract-audio"
    cmd = `yt-dlp $mode_flag --audio-format $audio_format --audio-quality $quality -o $output_template --newline $url`
    filename = ""
    open(`$cmd`, "r") do io
        for line in eachline(io)
            if occursin("[download]", line) && occursin("%", line)
                m = match(r"([0-9.]+)%", line)
                if m !== nothing
                    pct = parse(Float64, m.captures[1]) / 100
                    show_progress_bar(pct)
                end
            end
            if occursin("Destination:", line)
                filename = strip(split(line, ":")[end])
            end
            if occursin("Deleting original file", line)
                print("\r" * repeat(" ", 60) * "\r")
            end
        end
    end
    println()
    if !isempty(filename)
        open(history_file, "a") do f
            println(f, string(now(), " | ", filename))
        end
        println(basename(filename))
    end
end
