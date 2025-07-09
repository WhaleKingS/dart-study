class Integer {
  late int _value;
  //클래스 내에서 선언하는 변수 = 인스턴스 변수 = _vlaue

  // 생성자 (메인에서 사용해서, 상단에 입력했던 변수의 값을 담아주기 위해)
  // 생성자 이름() {};
  // 생성자의 이름은 클래스의 이름과 같아야한다.
  Integer([int givenValue = 0]) {
    //givenValue는 넣어주는 값, 넣어주지 않을시 기본값출력하게 함
    //생성할 때 변수를 입력하고 싶지 않다면 대괄호 [] 안에 변수를 선언하고, 기본값을 주면 됨

    _value = givenValue;
    //사용자가 준 givenValue 값을 우리의 인스턴스 변수,_value값에 담을거다
  }

  int get() {
    return _value;
  }

  void set(int givenValue) {
    _value = givenValue;
  }

  int get asInt => _value;
}

class TimemachineInteger extends Integer {}

class StringClass {
  late String _value;

  StringClass([String givenValue = "뭐"]) {
    _value = givenValue;
  }

  set(String givenValue) {
    _value = givenValue;
  }

  String get asString => "$_value";
}

class Player {
  late String _value;

  Player([String givenValue = "age"]) {
    _value = givenValue;
  }

  String get asPlayer => "$_value";
}

void main() {
  // var int1 = Integer();
  // var int2 = Integer(3);
  // var st1 = StringClass("안녕");
  var pl1 = Player("name");
  var pl2 = Player();
  // print(int1._value);
  // print(int2._value);
  // print(int1.get());
  // print(int2.get());

  // int1.set(10);
  // print(int1.get());
  // print(st1);
  // print(st1.set("잘가"));
  // print(st1.asString);

  print(pl1.asPlayer);
  print(pl2.asPlayer);
}
