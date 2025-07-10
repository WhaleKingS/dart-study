// name 과 age 를 입력받을 수 있는 player class를 만들고,
//해당 플레이어의 이름, 나이를 확인할 수 있는 getter 함수와
//해당 내역을 수정할 수 있는 setter 함수를 만들어라.

class Player {
  late String name;
  late int age;

  // 기본값 입력하는 방법 []

  Player(String givenname, [int givenage = 0]) {
    name = givenname;
    age = givenage;
  }

  //get 함수 인스턴스 변수들을 반환하는 함수
  //반활한 자료타입 get 함수명 => 변환할 값;
  String returnname() {
    return name;
  }

  int returnage() {
    return age;
  }

  //set 함수
  //반환할 자료형 함수 이름 (사용자가 변경할 값){}
  void setname(String givenname) {
    name = givenname;
  }

  void setage(int givenage) {
    age = givenage;
  }

  ///////
  ///
  ///
  String get getname => name;
  int get getage => age;

  set settername(String givenname) => name = givenname;
  set setterage(int givenage) => age = givenage;
}

void main() {
  var pl1 = Player("rnjsxodbs");

  print(pl1.returnage());

  print(pl1.returnname());

  pl1.settername = "짱구";
  pl1.setterage = 20;

  print(pl1.getname);
  print(pl1.getage);
}
