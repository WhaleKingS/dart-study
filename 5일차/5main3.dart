class NewBox<T> {
  late dynamic item;
  // set를 이용해서 값이 몇번 바뀌었는지 저장할 용도로 만드는 static 변수
  // 객체가 필요 없고, NewBox 라는 클래스 전체가 공유하는 변수
  static int changeCount = 0;

  // 우리가 이 클래스를 사용하기로 한 객체(메인에 있는 변수) 에서만 사용할 수 있는 변수
  // 객체 = 우리가 main 함수에서 var newNum1=NewBox(); 에서 newNum1
  int totalCount = 0;

  NewBox(T givenValue) {
    item = givenValue;
  }

  dynamic get() {
    return item;
  }

  void set(dynamic newitem) {
    item = newitem;
    changeCount = changeCount + 1;
    totalCount = totalCount + 1;
  }
}

void main() {
  var newBox = NewBox("참돔");
  var newBox2 = NewBox("참치");
  print(newBox.get());

  newBox.set(0);
  newBox2.set(1);

  NewBox.changeCount;

  print("newBox 객페가 변경된 횟수: ${newBox.totalCount}");
  print("newBox2 객체가 변경된 횟수: ${newBox2.totalCount}");
  print("NewBox 클래스가 변경괸 횟수: ${NewBox.changeCount}");
}
