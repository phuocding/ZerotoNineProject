# Docs List View in Team

![alt text](https://github.com/phuocding/ZerotoNineProject/blob/master/docs/home.PNG "Home Page")

- You can [access this link to follow tutorial](https://codelabs.developers.google.com/codelabs/flutter-firebase) or-hoặc hiểu nôm na cái project demo này như này

> App Hiển thị danh sách trong team `Free Code School` và vote cho từng cá nhân(optional liên kết với Firestore cloud).
###Overview & Structure
#### Part 1 cơ bản là:
- import cloud-firestore.dart `flugin` để communicating với Cliud Firestore.
- add vài dummy data(tạm thời vậy sau mình thay bằng các instance Cloud Firestore).
- set tên app là Free Code School.
#### Part 2 có gì vui:
- thú vị ở trong _MyHomePagestate class, `build` method định nghĩa khung ui có thứ tự(`widget hierarchy`).
+ có appbar(title là Team Votes)
+ có body chứa ListView sẽ render ra `dummy data points` mình cho ở trên thành 1 `list items`.
#### Part 3 có nhiệm vụ gì:
- widget _buildListItem đúng với tên gọi là build ra list items, từng item sẽ display ra 1 block hình chữ nhật với `name` và `vote` trong từng `data points`.
#### Part cuối thì làm gì:
- Ta có Record, một class `vô cùng tiện lợi` để ôm từng record, ko nhất thiết phải dùng nhưng nó làm code trở nên bớt dirty hơn.
```dart
class Record {
   final String name;
   final int votes;
   final DocumentReference reference;

   Record.fromMap(Map<String, dynamic> map, {this.reference})
   : assert(map['name'] != null),
   assert(map['votes'] != null),
   name = map['name'],
   votes = map['votes'];

   Record.fromSnapshot(DocumentSnapshot snapshot)
   :this.fromMap(snapshot.data, reference: snapshot.reference);

   @override
   String toString() => "Record<$name:$votes>";
 }
```

