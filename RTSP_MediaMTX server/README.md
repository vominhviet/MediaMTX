```


content = """MEDIAMTX – KIẾN TRÚC STREAM CAMERA
================================

1. LUỒNG TỔNG QUAN

Camera (172.16.20.13)
    |
    | RTSP/TCP – 1 luồng duy nhất
    | rtsp://admin:***@172.16.20.13:5553/live
    v
MediaMTX (172.16.20.22)
    |
    |-- RTSP  :8554/main
    |-- WebRTC :8889/main
    |-- HLS   :8888/main/stream.m3u8
    |-- RTMP  :1935/main
    |
    +--> Nhiều client kết nối đồng thời (fan-out)


2. THÀNH PHẦN

+----+----------------------+---------------------------------------------+
| STT| Thành phần           | Vai trò                                     |
+----+----------------------+---------------------------------------------+
| 1  | Camera               | Nguồn RTSP gốc                              |
| 2  | MediaMTX              | Nhận và nhân bản luồng cho nhiều client     |
| 3  | RTSP Output           | VLC / ffplay / ứng dụng hỗ trợ RTSP         |
| 4  | WebRTC Output         | Trình duyệt, độ trễ thấp                    |
| 5  | HLS Output            | HTML5 / trình duyệt, tương thích cao        |
| 6  | RTMP Output           | OBS / ứng dụng hỗ trợ RTMP                  |
+----+----------------------+---------------------------------------------+


3. ĐỊA CHỈ STREAM

Nguồn camera:
  rtsp://admin:***@172.16.20.13:5553/live

RTSP:
  rtsp://172.16.20.22:8554/main

WebRTC:
  http://172.16.20.22:8889/main

HLS:
  http://172.16.20.22:8888/main/stream.m3u8

RTMP:
  rtmp://172.16.20.22:1935/main


4. NGUYÊN LÝ HOẠT ĐỘNG

- Camera chỉ cần phát 1 luồng RTSP về MediaMTX.
- MediaMTX nhận luồng bằng RTSP/TCP để tăng độ ổn định.
- MediaMTX fan-out luồng cho nhiều client.
- Không cần camera tạo thêm nhiều kết nối.
- Client có thể sử dụng các giao thức khác nhau tùy nhu cầu.


5. ĐỘ TRỄ THAM KHẢO

RTSP   : ~200 ms
WebRTC : ~100 ms
RTMP   : ~500 ms
HLS    : ~2–5 giây
"""

path = Path("/mnt/data/mediamtx_camera_stream_architecture.txt")
path.write_text(content, encoding="utf-8")
print(path)

```
