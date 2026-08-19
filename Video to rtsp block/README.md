```
/root/mediamtx/
├── docker-compose.yml
├── mediamtx.yml
├── scripts/
│   └── start-streams.sh
└── videos/
    ├── block1/
    │   └── video_seaport.mp4
    ├── block2/
    │   └── video2.mp4
    └── block3/
        └── video3.mp4

```
# Và start-streams.sh sẽ chịu trách nhiệm tạo

```
block1/video_seaport.mp4
    └── cam1  → cam10

block2/video2.mp4
    └── cam11 → cam20

block3/video3.mp4
    └── cam21 → cam30
```


## Kiểm tra trước khi chạy:
```
chmod +x scripts/start-streams.sh

ls -lh videos/block1/video_seaport.mp4

ls -lh videos/block2/video2.mp4

ls -lh videos/block3/video3.mp4
``` 
# Sau đó:
```
docker compose up -d
```
