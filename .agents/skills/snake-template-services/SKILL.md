---
name: snake-template-services
description: Tích hợp service, remote và SafeTeleport vào vòng đời khởi động của SnakeTemp.
---

# snake-template-services

Đọc ServerStart.server.luau và Source/ModuleLoader.luau. Đặt ModuleScript server trong ServerScriptService/Services và đặt tên riêng vì loader lập chỉ mục theo tên. Trả về bảng có Setup hoặc Start khi cần. Setup chuẩn bị trạng thái nội bộ. Start nối các hệ thống sau khi tất cả Setup hoàn tất, nhưng các Start chạy đồng thời.

ServerStart gọi Network.startServer() trước ModuleLoader.Init(). Đưa logic gameplay phụ thuộc PlayerDataService hoặc SafeTeleport vào service do loader quản lý. Khi gặp lỗi require dây chuyền, tìm lỗi đầu tiên trong Output và đối chiếu bản Edit với source đang sync. Tránh chờ WaitForReadyAsync trong lifecycle mà chính loader đang chờ.

Khi thêm remote, kiểm tra Source/Libs/Network/RemoteName và dùng API Network hiện có. Với dịch chuyển, dùng SafeTeleport.Teleport(player, placeID, options) ở server. Kiểm tra bằng một phiên Play mới.
