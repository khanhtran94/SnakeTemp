---
name: snake-template-client
description: Kết hợp UI, input context và âm thanh bằng các controller client có sẵn của SnakeTemp.
---

# snake-template-client

Đọc Source/UI/UIWindowController và view gần nhất trong UI/Views. Đăng ký view bằng RegisterView, dùng OpenWindow hoặc PromptAsync theo loại tương tác. Đối chiếu tên GUI và container trong Studio khi Setup chờ lâu. Đọc giá trị HUD từ DataController sau khi dữ liệu ban đầu sẵn sàng.

Kiểm tra ReplicatedStorage.Inputs và bản clone dưới Player mà ServerStart tạo. Ghép PushContext với PopContext cùng tên khi mở và đóng giao diện cần đổi điều khiển. Với âm thanh client, kiểm tra AudioController.Setup và dùng PlaySoundToOutput với AudioPlayer. Chạy thử mở/đóng cửa sổ hai lần, xác nhận input trở lại đúng context và mỗi thao tác chỉ phát âm thanh một lần.
