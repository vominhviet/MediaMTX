scripts/start-streams.sh
#!/bin/bash

set -e

echo "========================================"
echo " Starting 30 fake RTSP cameras"
echo "========================================"

start_streams() {
    local block="$1"
    local video="$2"
    local start_cam="$3"
    local end_cam="$4"

    echo ""
    echo "[$block] Video: $video"
    echo "[$block] Cameras: cam${start_cam} -> cam${end_cam}"

    if [ ! -f "$video" ]; then
        echo "[$block] ERROR: Video không tồn tại: $video"
        return 1
    fi

    for i in $(seq "$start_cam" "$end_cam"); do

        echo "Starting cam$i ..."

        ffmpeg \
            -re \
            -stream_loop -1 \
            -i "$video" \
            -an \
            -c:v copy \
            -f rtsp \
            -rtsp_transport tcp \
            "rtsp://mediamtx:8554/cam$i" \
            > "/tmp/cam$i.log" 2>&1 &

    done
}

# ========================================
# BLOCK 1
# video_seaport.mp4 -> cam1 - cam10
# ========================================

start_streams \
    "block1" \
    "/videos/block1/video_seaport.mp4" \
    1 \
    10


# ========================================
# BLOCK 2
# video2.mp4 -> cam11 - cam20
# ========================================

start_streams \
    "block2" \
    "/videos/block2/video2.mp4" \
    11 \
    20


# ========================================
# BLOCK 3
# video3.mp4 -> cam21 - cam30
# ========================================

start_streams \
    "block3" \
    "/videos/block3/video3.mp4" \
    21 \
    30


echo ""
echo "========================================"
echo " 30 RTSP cameras started"
echo "========================================"

wait
