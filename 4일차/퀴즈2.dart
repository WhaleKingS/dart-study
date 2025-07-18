//탈것 이라는 뜻을 가진 Vehicle 추상 클래스에 drive라는 기능을 추가하세요.
//이후 Boat 와 Car 라는 클래스를 구현한 후,
//각각 클래스 별 drive 함수 실행시 다음의 내용을 출력하도록 구현하세요
//Boat:[보트가 물 위를 떠다닙니다.], Car:[자동차가 도로를 달립니다.]

abstract class Vehicle {
  void drive();
}

class Boat implements Vehicle {
  //추가적인 기능을 추상함수에 추가할때 override 추가해야한다.
  @override
  drive() {
    print("보트가 물 위를 떠다닙니다.");
  }
}

class Car implements Vehicle {
  @override
  drive() {
    print("자동차가 도로를 달려다닙니다.");
  }
}

void main() {
  var car = Car();
  var boat = Boat();

  car.drive();
  boat.drive();
}
