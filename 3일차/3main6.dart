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

  //인스턴스 변수를 반환하기 위한 함수
  int get() {
    return _value;
  }

  // 인스턴스 변수를 수정하기 위한 함수
  void set(int givenValue) {
    _value = givenValue;
  }

  //get, set을 계속 작성하기 너무 많으니 이걸 정리해서 getter와 setter로 만들어보기
  //getter
  //반활할 자료타입 get 함수명 => 변환할 값;
  String get returnString => "$_value";

  //setter
  //반활할 자료타입 set 함수명(사용자 입력값) => 변경할 내용;
  set changeNumber(int givenvalue) => _value = givenvalue;
}

void main() {
  var num1 = Integer(123123);

  // print(num1.get());
  // num1.set(112);
  // print(num1.get());

  print(num1.returnString);
  //setter 사용 방법
  //클래스. 작성한함수 = 변경할 값;
  num1.changeNumber = 11;
}
