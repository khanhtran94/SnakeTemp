---
name: snake-template-pickups
description: Tạo coin hoặc vật phẩm nhặt được bằng tag, thưởng trên server và hồi vật phẩm trong SnakeTemp.
---

# snake-template-pickups

Tạo service trong ServerScriptService/Services. Trong Start, đăng ký GetInstanceAddedSignal và xử lý GetTagged. Dùng bảng connection theo Instance để đăng ký mỗi Part một lần. Nếu chỉ nhận vật phẩm trong Workspace, xét cả trường hợp Part đã có tag được chuyển từ ServerStorage sang Workspace trong cùng DataModel. Hủy kết nối khi Part rời phạm vi và tránh callback hồi cũ áp dụng vào lượt đăng ký mới.

Khi Touched, xác định nhân vật và Player ở server. Khóa riêng từng Part trước khi cộng thưởng qua PlayerDataService.UpdateData. Mở khóa ngay nếu chưa có profile. Chỉ đổi trạng thái hiển thị và bắt đầu hồi khi cập nhật thành công. Lấy giá trị thưởng từ cấu hình server. Kiểm tra hai người chạm cùng lúc, vật phẩm spawn sau Start và hai Part có cooldown độc lập.
