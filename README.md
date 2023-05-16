# Flutter GetX Base Project

Dựa theo kinh nghiệm ít ỏi và thời gian dùng GetX của mình, đây là base cấu trúc thư mục, cũng như các package cần thiết/hàm mà mình hay dùng.
Hi vọng sẽ giúp ích được cho bạn!

## 📝 Mục lục

- [Cài đặt](#🛠-Cài-đặt)
  - [Clone từ source này](#Clone-từ-source-này)
  - [Sử dụng Get Cli](#Sử-dụng-get-cli)
    - [Cài đặt Get cli](#Cài-đặt-GET-CLI)
    - [Get init](#Get-init)
- [Tính năng](#🚀-Tính-năng)
- [Giao diện](#Giao-diện)

## 🛠 Cài đặt

### Clone từ source này

- Copy toàn bộ thư mục lib/ và ghi đè nó vào project của bạn.
- Dựa theo mẫu file `pubspec.yaml` dưới dây bạn copy và chọn lọc tương ứng

```yaml
environment:
  sdk: ">=3.0.0	 <4.0.0"
  flutter: ^3.10.0

dependencies:
  cupertino_icons: any
  get: any
  intl: any
  firebase_core: any
  firebase_auth: any
  flutter_local_notifications: ^14.0.0+1 #nên sử dụng từ phiên bản này trở lên
  cloud_firestore: any #dung de load data notify
  firebase_messaging: any
  shared_preferences: any
  flutter_form_builder: any #bingding form
  form_builder_validators: any
  fluttertoast: any
  flutter_svg: any
  flutter_localizations:
    sdk: flutter
  flutter:
    sdk: flutter

dev_dependencies:
  flutter_lints: ^2.0.1
  flutter_test:
    sdk: flutter

flutter:
  uses-material-design: true
  assets:
    - assets/images/
    - assets/svg/
    - assets/gif/
    - assets/translations/
```

### Sử dụng Get Cli

#### **Cài đặt GET CLI**

Tải source [Get CLI](https://github.com/wwwwww3q/get_cli_basemodel_generator) mà mình đã tự custom.

Sau khi download xong, mở CommandLine tại vị trí của source Get CLI và gõ theo lệnh:

```bash
dart pub global activate --source path .
```

Nó sẽ tự động sinh ra file `get.bat`, thường thì đường dẫn phát sinh sẽ nằm tại đây:
| Platform | Directory |
| ----------------- | ------------------------------------------------------------------ |
| Window | %USERPROFILE%\AppData\Local\Pub\Cache\bin |
| MacOS | Users\%USERPROFILE%\.pub-cache\bin |

Enviroment của [Get CLI](https://github.com/wwwwww3q/get_cli_basemodel_generator) không tự động cập nhật vào terminal của bạn. Nên lúc này khi lần đầu chạy, bạn phải cấu hình Enviroment cho nó.

#### Window:

1. `Windows+R` và gõ `sysdm.cpl`.
2. Phía trên chọn Tab `Advanced` > click nút `Environment Variables` ở dưới.
3. Màn hình dưới của `System Variables`, tìm chữ `Path` Double-click để mở Edit.
4. Copy đường dẫn Directory ở trên, chọn `New` và dán vào.
5. [Chạy thử](#Bật-CommandLine-lên-chạy-với-quyền-administrator,-gõ-`get`-xem-nó-có-chạy-được-không).

#### MacOS:

Gõ lệnh để thêm Environment

```bash
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

Full code file `.zshrc` của mình được cấu hình như sau:

```shell
export PATH="$PATH:$HOME/Program Files/flutter/bin"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/.dotnet/tools"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export NEWLINE=$'\n'
PROMPT="[%F{green}%*%f]:%F{magenta}%n%f:%F{011}%~%f:%F{014}$(parse_git_branch)$NEWLINE%F{010}$%f "
```

để áp dụng terminal chạy với lệnh.

```bash
source ~/.zshrc
```

#### Bật CommandLine lên chạy với quyền administrator, gõ `get` xem nó có chạy được không

<img width="300" src="assets/assets_readme/test_get_command.png">

Bạn có thể tìm hiểu thêm nếu không rõ... Nội dung này sẽ được update cụ thể sau.

#### **Get init**

chạy lệnh để tạo template project

```bash
get init
```

Nhập con số để tạo mẫu (nhấn enter 2 lần để tạo template của mình)
![Get Init](assets/assets_readme/get_init_with_template.png)

Vậy là xong !. `Lưu ý` rằng quá trình này sẽ xóa hết lib/ của bạn. Nên migrate từ từ sang nếu bạn đã có project sẵn.
Còn mới vừa tạo thì thôi.

## 🚀 Tính năng

Lưu ý: mình chỉ liệt kê 1 số cái thường dùng. muốn biết thêm về Get Cli, bạn có thể tham khảo bản gốc [tại đây](https://pub.dev/packages/get_cli)

### **Generate Module**

```bash
get create page:name
```

Lệnh này cho phép bạn tạo các modules nhanh bao gồm bộ 3 [Controller, Binding, View]

Tự động tạo đường dẫn AppPages, AppRoutes

Có thể tạo modules bên trong modules khác

```bash
get create page:name on other_module
```

Khi sử dụng `on` để tạo modules mới, CLI sẽ sử dụng [children pages](https://github.com/jonataslaw/getx/blob/master/CHANGELOG.md#3210---big-update).

### **Generate Model**

```bash
get generate model on response with assets/import_response.json
```

Khi sử dụng template của mình, trong assets có file sẵn `import_response.json`, chỉ việc ném json cần generate model vào đây. Sẽ tự tạo model theo cấu trúc `BaseModel`
Nếu thấy lỗi đỏ file là do thiếu import, cứ bấm gợi ý và chọn auto import file base_model.dart

### **Generate Translation**

```bash
get generate locales assets/translations
```

Lệnh này sẽ tạo ra file chuyển đổi ngôn ngữ dựa theo json.
Để sử dụng chỉ việc LocaleKeys.KeyName.tr
Sử dụng hàm có sẵn mà template này có `TranslationService.changeLocale` để chuyển ngôn ngữ và lưu vào hệ thống

### **API Call**

Tùy chỉnh BaseURL tại `/app/core/config/api_url.dart` > `base_url`

Gọi api đơn giản với hàm `apiCall.onRequest` tại BaseController

```dart
final UsersModel? result = await apiCall.onRequest(
      ApiUrl.post_auth_login(),
      RequestMethod.POST,
      body: {
        'userName': 'foo',
        'password': 'bar',
      },
      baseModel: UsersModel(),
    );
```

Các tham số của `onRequest`

| Type                    | Parameter       | Description                                                                                                                    |
| :---------------------- | :-------------- | :----------------------------------------------------------------------------------------------------------------------------- |
| `String`                | `url`           | **Required**. Đường dẫn api (vd: '/auth/login') key                                                                            |
| `RequestMethod`         | `method`        | **Required**. GET, POST, PUT, PATH, DELETE key                                                                                 |
| `dynamic`               | `body`          | Có thể truyền vào FormData để gửi hình ảnh, hoặc truyền Map<String,dynamic>, hoặc truyền vào object model có kế thừa BaseModel |
| `BaseModel?`            | `baseModel`     | Khi api trả về, mong muốn parse thành Model nào key                                                                            |
| `Map<String, dynamic>?` | `queryParam`    | Thường dùng cho phương thức GET để tìm kiếm key                                                                                |
| `bool?`                 | `isShowLoading` | Muốn hiện loadding ở api này hay không (mạc định true) key                                                                     |

Có thể tùy chỉnh UI `LoaddingWidget` tại `/app/custom/widget/loadding_widget.dart`

## Giao diện
