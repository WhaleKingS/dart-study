void createPlayer({
  required String name,
  required String phone,
  var age = "비공개",
}) {
  print('제 이름은 $name, 전화번호는 $phone 이며, 제 나이는 $age 입니다.');
}

void main() {
  createPlayer(name: '권태윤', phone: '010-8006-9816', age: '22');
  createPlayer(name: 'rnjsxodbs', phone: '010-8006-9817');
}
