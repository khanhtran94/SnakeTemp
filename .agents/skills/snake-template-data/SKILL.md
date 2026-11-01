---
name: snake-template-data
description: Thêm dữ liệu người chơi, lưu ProfileStore2, đồng bộ client và hiển thị leaderstats trong SnakeTemp.
---

# snake-template-data

Thêm trường vào cả Source/Types/PlayerDataType và Services/PlayerDataService/DefaultPlayerData. Reconcile bổ sung trường thiếu. Nếu thay store hoặc key, xác định dữ liệu cũ và cách chuyển một lần trước khi dùng cho người chơi thật.

Dùng PlayerDataService.UpdateData(player, callback) ở server. Callback sửa bản sao, không yield. Kiểm tra giá trị boolean trả về. GetProfile trả snapshot chỉ đọc. ProfileStore2 tự lưu luân phiên theo AUTO_SAVE_PERIOD và kết thúc session khi thoát. Kiểm tra tên store Studio và live trong PlayerDataService trước khi chẩn đoán mất dữ liệu.

Để tạo leaderstats, nối PlayerProfileLoaded và OnDataUpdated, rồi xử lý người đã có profile. Gán số dư mới khi deltas.Coins khác nil. Kiểm tra chỉ một hệ thống tạo bảng điểm hoặc ghi store. Với HUD, dùng DataController và DataReplicationService hiện có. Kiểm thử bằng số dư trước/sau nhận thưởng rồi vào lại.
