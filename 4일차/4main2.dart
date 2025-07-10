//여러 클래스들이 공통적으로 가지고 있는 기능이지만,
//각 클래스마다 미세하게 작동하는 부분이 다른 경우
//이런 기능이 있다 라고 작성만 하는것

abstract class Rectangle {
  void draw();
}

class Circle implements Rectangle {
  late int radius;

  @override
  void draw() {
    print("원을 그리빈다.");
  }

  Circle([int givenRadius = 1]) {
    radius = givenRadius;
  }
}

class Square implements Rectangle {
  late int garo, sero;

  @override
  void draw() {
    print("사각형을 그립니다");
  }

  Square([int givengaro = 5, int givensero = 7])
    : garo = givengaro,
      sero = givensero;
}

void main() {
  var circle = Circle(6);
  var square = Square();

  circle.draw();
  square.draw();
}
