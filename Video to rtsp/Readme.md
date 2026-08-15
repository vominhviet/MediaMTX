# Cấu trúc file

```
~/mediamtx/
├── docker-compose.yml
├── videos/
│   ├── cam1/
│   │   └── video.mp4
│   ├── cam2/
│   │   └── video.mp4
└── scripts/
    └── start-streams.sh
```

## Mapping:

videos/cam1/video.mp4 → rtsp://IP:8554/cam1

videos/cam2/video.mp4 → rtsp://IP:8554/cam2


# Cách chạy:

```
chmod +x scripts/start-streams.sh
docker compose up -d
```

# Kết quả ra:

cam1 → rtsp://IP:8554/cam1

cam2 → rtsp://IP:8554/cam2

# Test: 

```
ffplay -rtsp_transport tcp rtsp://172.16.20.26:8554/cam1
```
