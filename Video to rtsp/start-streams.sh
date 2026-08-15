
#!/bin/bash

for dir in /videos/cam*; do
    [ -d "$dir" ] || continue

    cam=$(basename "$dir")
    video=$(find "$dir" -type f \( -name "*.mp4" -o -name "*.mkv" \) | head -1)

    if [ -z "$video" ]; then
        echo "[$cam] Không tìm thấy video"
        continue
    fi

    echo "[$cam] $video -> rtsp://mediamtx:8554/$cam"

    ffmpeg \
        -re \
        -stream_loop -1 \
        -i "$video" \
        -an \
        -c:v copy \
        -f rtsp \
        "rtsp://mediamtx:8554/$cam" &
done

wait

