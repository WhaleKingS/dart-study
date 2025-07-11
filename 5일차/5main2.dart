class Box {
  late int item;

  Box(int givenItem) : item = givenItem;

  int get() {
    return item;
  }

  void set(int newitem) {
    item = newitem;
  }
}

class StringBox {
  late String item;

  StringBox(String givenItem) : item = givenItem;

  String get() {
    return item;
  }

  void set(String newitem) {
    item = newitem;
  }
}

// 타입이 바뀌었다고 새롭게 클래스를 하나 더 만들려면 귀찮으니
// 두 클래스를 합치기 위해 Generic 을 사용함

// class 클래스명<T{아무거나 상관ㄴ}}> {}

class NewBox<T> {
  late dynamic item;

  // 사용자가 입력한 givenValue 의 자료형을 항상 따라갈거야.
  // 사용자가 1을 입력하게 되면 T -> int 자료형이 되는거고
  // 사용자가 "기계" 를 입력하게 되면 -> String  자료형이 되는거다
  NewBox(T givenValue) {
    item = givenValue;
  }

  dynamic get() {
    return item;
  }

  void set(dynamic newitem) {
    item = newitem;
  }
}

void main() {
  var newBox = NewBox("참돔");

  print(newBox.get());

  newBox.set(1231231.23123123);
  print(newBox.get());
}
