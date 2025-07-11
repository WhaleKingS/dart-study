// 하나의 클래스에서 여러개의 자료형을 관리해야 할때
// class 클래스명<T> {
//  T 인스턴스 변수명;
// }

class Box<T> {
  T value;

  Box(T givenvalue) : value = givenvalue;
  //박스 안에 있는 givenvalue 의 속성에 따라 value 속성이 바뀐다

  T getValue() {
    print(value.runtimeType);
    return value;
  }
}

void main() {
  var box = Box("시계");
  var box2 = Box(1000);
  var box3 = Box(1.1);

  print(box.getValue());
  print(box2.getValue());
  print(box3.getValue());
}
