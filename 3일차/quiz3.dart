// name 과 age 를 입력받을 수 있는 player class를 만들고,
//해당 플레이어의 이름, 나이를 확인할 수 있는 getter 함수와
//해당 내역을 수정할 수 있는 setter 함수를 만들어라.

class Player {
  late String _value;
  late String _string;

  Player([String name = "", String age = ""]) {
    _value = name;
    _string = age;
  }

  String get() {
    return _value;
  }
}

void main() {
  var pl1 = Player("rnjsxodbs", "24");

  print(pl1.get());
}
